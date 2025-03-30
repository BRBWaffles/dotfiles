{
  flake,
  config,
  pkgs,
  ...
}:
let
  inherit (flake.config.people) user0;
  inherit (flake.config.people.users.${user0}) name;
  inherit (flake.config.machines.devices) ceres;
  inherit (flake.config.services.instances) nextcloud nginx web;
  service = nextcloud;
  localhost = web.localhost.address0;
  host = "${service.subdomain}.${web.domains.url1}";
in
{
  services = {
    nextcloud = {
      appstoreEnable = true;
      autoUpdateApps.enable = true;
      configureRedis = true;
      enable = true;
      hostName = host;
      https = true;
      package = pkgs.nextcloud30;
      phpOptions."opcache.interned_strings_buffer" = "24";
      extraAppsEnable = true;
      extraApps = {
        inherit (config.services.service.package.packages.apps)
          contacts
          calendar
          ;
      };
      config = {
        adminpassFile = config.sops.secrets."${service.name}-pass".path;
        adminuser = name;
        dbtype = "pgsql";
      };
      database = {
        createLocally = true;
      };
      settings = {
        default_phone_region = "CA";
        log_type = "file";
        mail_sendmailmode = "pipe";
        mail_smtpmode = "sendmail";
        maintenance_window_start = 4;
        overwriteprotocol = "https";
        trusted_proxies = [
          localhost
        ];
      };
    };

    nginx = {
      enable = true;
      virtualHosts.${host}.listen = [
        {
          addr = web.localhost.address1;
          port = nginx.ports.port0;
        }
      ];
    };

    caddy = {
      virtualHosts = {
        "${host}" = {
          extraConfig = ''
            reverse_proxy ${localhost}:${toString nginx.ports.port0}

            tls ${service.ssl.cert} ${service.ssl.key}
          '';
        };
      };
    };
  };

  sops =
    let
      sopsPath = secret: {
        path = "${service.sops.path0}/${service.name}-${secret}";
        owner = service.name;
        mode = "600";
      };
    in
    {
      secrets = builtins.listToAttrs (
        map
          (secret: {
            name = "${service.name}-${secret}";
            value = sopsPath secret;
          })
          [
            "pass"
          ]
      );
    };

  fileSystems."/var/lib/${service.name}" = {
    device = service.paths.path0;
    fsType = "none";
    options = [
      "bind"
    ];
    depends = [
      ceres.storage0.mount
    ];
  };

  systemd.tmpfiles.rules = [
    "Z ${service.paths.path0} 750 ${service.name} ${service.name} -"
    "Z ${service.sops.path0} 750 ${service.name} ${service.name} -"
  ];

  users.users.${service.name}.extraGroups = [
    "caddy"
    "nginx"
    "postgres"
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
        nginx.ports.port0
        service.ports.port0
      ];
    };
  };
}

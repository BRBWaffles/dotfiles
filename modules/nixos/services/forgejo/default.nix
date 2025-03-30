{
  flake,
  config,
  ...
}:
let
  inherit (flake.config.machines.devices)
    ceres
    ;
  inherit (flake.config.services.instances) smtp forgejo web;
  service = forgejo;
  localhost = web.localhost.address0;
  host = "${service.subdomain}.${web.domains.url3}";
in
{
  services = {
    forgejo = {
      enable = true;
      database.type = "postgres";
      lfs.enable = true;
      secrets = {
        mailer.PASSWD = config.sops.secrets."${service.name}-smtp".path;
        database.PASSWD = config.sops.secrets."${service.name}-database".path;
      };
      dump = {
        interval = "5:00";
        type = "zip";
        file = "forgejo-backup";
        enable = true;
      };
      settings = {
        server = {
          DOMAIN = host;
          ROOT_URL = "https://${host}/";
          HTTP_PORT = service.ports.port0;
        };
        # If you need to start from scratch, don't forget to turn this off again
        service.DISABLE_REGISTRATION = true;
        actions = {
          ENABLED = true;
          DEFAULT_ACTIONS_URL = "github";
        };
        mirror = {
          ENABLED = true;
        };
        mailer = {
          ENABLED = true;
          SMTP_ADDR = smtp.hostname;
          FROM = service.email.address0;
          USER = service.email.address0;
          PROTOCOL = "smtp+starttls";
          SMTP_PORT = smtp.ports.port0;
          SEND_AS_PLAIN_TEXT = true;
          USE_CLIENT_CERT = false;
        };
      };
    };
    caddy = {
      virtualHosts = {
        "${host}" = {
          extraConfig = ''
            reverse_proxy ${localhost}:${toString service.ports.port0}

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
            "smtp"
            "database"
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
    "Z ${service.paths.path0} 755 ${service.name} ${service.name} -"
    "Z ${service.sops.path0} 755 ${service.name} ${service.name} -"
  ];

  users.users.${service.name}.extraGroups = [
    "caddy"
    "postgres"
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
      ];
    };
  };
}

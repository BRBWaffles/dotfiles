{
  flake,
  config,
  pkgs,
  ...
}:
let
  inherit (flake.config.machines.devices)
    ceres
    ;
  inherit (flake.config.services.instances)
    caddy
    peertube
    smtp
    web
    ;
  service = peertube;
  localhost = web.localhost.address0;
  host = "${service.subdomain}.${web.domains.url3}";
in
{
  services = {
    peertube = {
      configureNginx = false;
      enable = true;
      enableWebHttps = true;
      group = service.name;
      listenWeb = caddy.ports.port1;
      listenHttp = service.ports.port0;
      localDomain = host;
      serviceEnvironmentFile = config.sops.secrets."${service.name}-root".path;
      user = service.name;
      plugins = {
        enable = true;
        plugins = builtins.attrValues {
          inherit (pkgs)
            peertube-plugin-livechat
            peertube-plugin-matomo
            peertube-plugin-transcoding-custom-quality
            peertube-theme-dark
            ;
        };
      };

      secrets = {
        secretsFile = config.sops.secrets."${service.name}-secret".path;
      };
      settings = {
        instance = {
          name = "upRootNutrition";
        };
        log = {
          level = "debug";
        };
        smtp = {
          transport = "smtp";
          disable_starttls = false;
          from_address = service.email.address0;
          hostname = smtp.hostname;
          port = smtp.ports.port0;
          username = service.email.address0;
          tls = false;
        };
      };
      database = {
        createLocally = true;
        passwordFile = config.sops.secrets."${service.name}-database".path;
      };
      redis = {
        enableUnixSocket = true;
        createLocally = true;
        passwordFile = config.sops.secrets."${service.name}-redis".path;
      };
      smtp = {
        createLocally = true;
        passwordFile = config.sops.secrets."${service.name}-smtp".path;
      };
    };

    caddy = {
      virtualHosts = {
        ${host} = {
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
        path = "${service.sops.path0}/${service.name}-${secret}-pass";
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
            "redis"
            "root"
            "secret"
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
    "nginx"
    "caddy"
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
        service.ports.port1
        service.ports.port2
        service.ports.port3
        service.ports.port4
      ];
    };
  };
}

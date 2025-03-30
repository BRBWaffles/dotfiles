{
  flake,
  config,
  ...
}:
let
  inherit (flake.config.services.instances) smtp vaultwarden web;
  service = vaultwarden;
  localhost = web.localhost.address0;
  host = "${service.subdomain}.${web.domains.url0}";
in
{
  services = {
    vaultwarden = {
      backupDir = service.paths.path0;
      enable = true;
      environmentFile = config.sops.secrets."${service.name}/env".path;
      config = {
        # Domain Configuration
        DOMAIN = "https://${host}";

        # Email Configuration
        SMTP_AUTH_MECHANISM = "Plain";
        SMTP_EMBED_IMAGES = true;
        SMTP_FROM = service.email.address0;
        SMTP_FROM_NAME = service.label;
        SMTP_HOST = smtp.hostname;
        SMTP_PORT = smtp.ports.port0;
        SMTP_SECURITY = "starttls";
        SMTP_USERNAME = service.email.address0;

        # Security Configuration
        DISABLE_ADMIN_TOKEN = false;

        # Event and Backup Management
        EVENTS_DAYS_RETAIN = 90;

        # User Features
        SENDS_ALLOWED = true;
        SIGNUPS_VERIFY = true;
        WEB_VAULT_ENABLED = true;

        # Rocket (Web Server) Settings
        ROCKET_ADDRESS = localhost;
        ROCKET_PORT = service.ports.port0;
      };
    };
    caddy = {
      virtualHosts = {
        "${host}" = {
          extraConfig = ''
            reverse_proxy ${localhost}:${toString service.ports.port0} {
              header_up X-Real-IP {remote_host}
            }

            tls ${service.ssl.cert} ${service.ssl.key}

            encode zstd gzip
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
            name = "${service.name}/${secret}";
            value = sopsPath secret;
          })
          [
            "env"
          ]
      );
    };

  systemd.tmpfiles.rules = [
    "Z ${service.paths.path0} 0755 ${service.name} ${service.name} -"
    "Z ${service.sops.path0} 755 ${service.name} ${service.name} -"
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
      ];
    };
  };
}

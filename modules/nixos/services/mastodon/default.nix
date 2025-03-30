{
  flake,
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (flake.config.machines.devices)
    ceres
    ;
  inherit (flake.config.services.instances) smtp mastodon web;
  service = mastodon;
  host = "${mastodon.subdomain}.${web.domains.url3}";
  localhost = web.localhost.address0;
in
{
  # If you need to start fresh for some reason, run these to create the new Admin account:
  # sudo -u mastodon mastodon-tootctl accounts create nick --email=nick@localhost --confirmed --role=Owner
  # sudo -u mastodon mastodon-tootctl accounts approve nick

  # If you fuck up and lose the password, use this:
  # sudo mastodon-tootctl accounts modify --reset-password nick

  # If you really fuck up and name yourself wrong, use this shit
  # sudo mastodon-tootctl accounts modify username --remove-role

  # nixpkgs.overlays = [
  #   (
  #     final: prev: {
  #       mastodon = prev.mastodon.overrideAttrs (oldAttrs: {
  #         postPatch =
  #           (oldAttrs.postPatch or "")
  #           + ''
  #             patch -p1 < ${./chars.patch}
  #           '';
  #       });
  #     }
  #   )
  # ];

  services = {
    mastodon = {
      enable = true;
      localDomain = host;
      secretKeyBaseFile = "/var/lib/mastodon/secrets/secret-key-base";
      streamingProcesses = 7;
      trustedProxy = localhost;
      automaticMigrations = true;
      database = {
        createLocally = true;
        name = service.name;
        host = "/run/postgresql";
        user = service.name;
        passwordFile = config.sops.secrets.mastodon-database.path;
      };
      extraConfig = {
        SINGLE_USER_MODE = "true";
        SMTP_AUTH_METHOD = "plain";
        SMTP_DELIVERY_METHOD = "smtp";
        SMTP_ENABLE_STARTTLS_AUTO = "true";
        SMTP_SSL = "false";
      };
      mediaAutoRemove = {
        enable = true;
        olderThanDays = 14;
      };
      redis = {
        createLocally = true;
        enableUnixSocket = true;
      };
      sidekiqThreads = 25;
      sidekiqProcesses = {
        all = {
          jobClasses = [
          ];
          threads = null;
        };
        default = {
          jobClasses = [
            "default"
          ];
          threads = 5;
        };
        ingress = {
          jobClasses = [
            "ingress"
          ];
          threads = 5;
        };
        push-pull = {
          jobClasses = [
            "push"
            "pull"
          ];
          threads = 5;
        };
        mailers = {
          jobClasses = [
            "mailers"
          ];
          threads = 5;
        };
      };
      smtp = {
        authenticate = true;
        createLocally = false;
        fromAddress = "upRootNutrition <${service.email.address0}>";
        host = smtp.hostname;
        passwordFile = config.sops.secrets.mastodon-smtp.path;
        port = smtp.ports.port0;
        user = service.email.address0;
      };
    };
    caddy = {
      virtualHosts = {
        "${host}" = {
          extraConfig = ''
            handle_path /system/* {
              file_server * {
                root /var/lib/mastodon/public-system
              }
            }

            handle /api/v1/streaming/* {
              reverse_proxy unix//run/mastodon-streaming/streaming.socket
            }

            route * {
              file_server * {
                root ${pkgs.mastodon}/public
                pass_thru
              }
              reverse_proxy * unix//run/mastodon-web/web.socket
            }

            tls ${service.ssl.cert} ${service.ssl.key}

            handle_errors {
              root * ${pkgs.mastodon}/public
              rewrite 500.html
              file_server
            }

            encode gzip

            header /* {
              Strict-Transport-Security "max-age=31536000;"
            }
            header /emoji/* Cache-Control "public, max-age=31536000, immutable"
            header /packs/* Cache-Control "public, max-age=31536000, immutable"
            header /system/accounts/avatars/* Cache-Control "public, max-age=31536000, immutable"
            header /system/media_attachments/files/* Cache-Control "public, max-age=31536000, immutable"
          '';
        };
      };
    };
  };

  systemd.services.caddy.serviceConfig.ReadWriteDirectories = lib.mkForce [
    "/var/lib/caddy"
    "/run/mastodon-web"
  ];

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
            "redis"
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
    "Z ${service.paths.path0} 0755 ${service.name} ${service.name} -"
    "Z ${service.sops.path0} 0755 ${service.name} ${service.name} -"
  ];

  users.users.${service.name}.extraGroups = [
    "postgres"
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
      ];
    };
  };
}

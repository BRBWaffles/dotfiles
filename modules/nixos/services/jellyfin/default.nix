{ flake, ... }:
let
  inherit (flake.config.people)
    user0
    ;
  inherit (flake.config.machines.devices)
    ceres
    ;
  inherit (flake.config.services.instances)
    jellyfin
    web
    ;
  service = jellyfin;
  localhost = web.localhost.address0;
  host = "${service.subdomain}.${web.domains.url0}";
in
{
  services = {
    jellyfin = {
      enable = true;
      openFirewall = true;
      user = user0;
    };
    jellyseerr = {
      openFirewall = true;
      enable = true;
    };
    caddy = {
      virtualHosts = {
        "${host}" = {
          extraConfig = ''
            redir /.well-known/carddav /remote.php/dav/ 301
            redir /.well-known/caldav /remote.php/dav/ 301

            reverse_proxy ${localhost}:${toString service.ports.port1}

            tls ${service.ssl.cert} ${service.ssl.key}
          '';
        };
      };
    };
  };

  fileSystems =
    let
      settings = {
        fsType = "none";
        options = [
          "bind"
        ];
        depends = [
          ceres.storage0.mount
        ];
      };
    in
    {
      "/var/lib/${service.name}" = {
        device = service.paths.path0;
      } // settings;
      "/var/cache/${service.name}" = {
        device = "${service.paths.path0}/cache";
      } // settings;
    };

  systemd.tmpfiles.rules = [
    "Z ${service.paths.path0} 0755 ${user0} ${service.name} -"
    "Z ${service.paths.path0}/cache 0755 ${user0} ${service.name} -"
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
        service.ports.port1
        service.ports.port2
      ];
    };
  };
}

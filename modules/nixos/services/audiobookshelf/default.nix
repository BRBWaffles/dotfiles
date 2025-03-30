{ flake, config, ... }:
let
  inherit (flake.config.services.instances) audiobookshelf web;
  inherit (flake.config.machines.devices) ceres;
  service = audiobookshelf;
  host = "${service.subdomain}.${web.domains.url0}";
  localhost = web.localhost.address0;
in
{
  services = {
    audiobookshelf = {
      enable = true;
      host = localhost;
      port = service.ports.port0;
      dataDir = service.name;
      openFirewall = true;
    };
    caddy = {
      virtualHosts = {
        "${host}" = {
          extraConfig = ''
            redir /.well-known/carddav /remote.php/dav/ 301
            redir /.well-known/caldav /remote.php/dav/ 301

            reverse_proxy ${localhost}:${toString service.ports.port0}

            tls ${service.ssl.cert} ${service.ssl.key}

            encode gzip zstd
          '';
        };
      };
    };
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
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
      ];
    };
  };
}

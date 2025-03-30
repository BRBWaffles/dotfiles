{ flake, ... }:
let
  inherit (flake.config.services.instances)
    owncast
    web
    ;
  service = owncast;
  localhost = web.localhost.address1;
  host = "${service.subdomain}.${web.domains.url1}";
in
{
  services = {
    owncast = {
      enable = true;
      listen = localhost;
      port = service.ports.port0;
      openFirewall = true;
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

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
        service.ports.port1
      ];
    };
  };

  # OBS Server rtmp://192.168.50.140:1935/live
}

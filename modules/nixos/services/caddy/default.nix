{ flake, ... }:
let
  inherit (flake.config.services.instances)
    caddy
    web
    ;

  domain0 = web.domains.url0;

  service = caddy;
in
{
  services.caddy = {
    enable = true;
    virtualHosts = {
      "${domain0}" = {
        extraConfig = ''
          tls /var/lib/acme/${domain0}/fullchain.pem /var/lib/acme/${domain0}/key.pem
          encode zstd gzip
        '';
      };
    };
  };

  users.users.${service.name}.extraGroups = [
    "acme"
    "nextcloud"
    "mastodon"
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
        service.ports.port1
      ];
    };
  };
}

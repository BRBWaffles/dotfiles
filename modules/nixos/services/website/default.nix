{ flake, ... }:
let
  inherit (flake.config.services.instances)
    upRootNutrition
    web
    ;
  service = upRootNutrition;
  host = web.domains.url3;
in
{
  services = {
    caddy = {
      virtualHosts = {
        "${host}" = {
          extraConfig = ''
            root * ${service.paths.path0}

            file_server

            encode gzip

            try_files {path} /index.html

            tls ${service.ssl.cert} ${service.ssl.key}
          '';
        };
      };
    };
  };
  systemd.tmpfiles.rules = [
    "Z ${service.paths.path0} 755 caddy caddy -"
  ];
}

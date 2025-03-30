{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain0
    jellyfinLabel
    jellyfinName
    servicePath
    sslPath
    sopsPath
    ;
in
{
  label = jellyfinLabel;
  name = jellyfinName;
  sops = {
    path0 = "${sopsPath}/${jellyfinName}";
  };
  subdomain = jellyfinName;
  paths = {
    path0 = "${servicePath}/${jellyfinLabel}";
  };
  ports = {
    port0 = 5055; # Jellyseer
    port1 = 8096; # Jellyfin HTTP
    port2 = 8920; # Jellyfin HTTPS
  };
  ssl = {
    cert = "${sslPath}/${jellyfinName}.${domain0}/fullchain.pem";
    key = "${sslPath}/${jellyfinName}.${domain0}/key.pem";
  };
}

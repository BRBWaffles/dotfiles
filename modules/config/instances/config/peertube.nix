{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain3
    servicePath
    sslPath
    sopsPath
    ;

  peertubeLabel = "PeerTube";
  peertubeName = "peertube";
  peertubeSubdomain = "video";
in
{
  label = peertubeLabel;
  name = peertubeName;
  email = {
    address0 = "noreply@${domain3}";
  };
  sops = {
    path0 = "${sopsPath}/${peertubeName}";
  };
  subdomain = peertubeSubdomain;
  paths = {
    path0 = "${servicePath}/${peertubeLabel}";
  };
  ports = {
    port0 = 9000; # HTTP
    port1 = 1935;
    port2 = 1936;
    port3 = 5432;
    port4 = 52800;
  };
  ssl = {
    cert = "${sslPath}/${peertubeSubdomain}.${domain3}/fullchain.pem";
    key = "${sslPath}/${peertubeSubdomain}.${domain3}/key.pem";
  };
}

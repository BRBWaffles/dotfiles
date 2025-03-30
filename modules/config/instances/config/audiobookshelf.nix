{ instancesFunctions }:
let
  inherit (instancesFunctions)
    audiobookshelfLabel
    audiobookshelfName
    domain0
    servicePath
    sslPath
    sopsPath
    ;
  audiobookshelfSubdomain = "books";
in
{
  label = audiobookshelfLabel;
  name = audiobookshelfName;
  sops = {
    path0 = "${sopsPath}/${audiobookshelfName}";
  };
  subdomain = audiobookshelfSubdomain;
  paths = {
    path0 = "${servicePath}/${audiobookshelfLabel}";
  };
  ports = {
    port0 = 8000;
  };
  ssl = {
    cert = "${sslPath}/${audiobookshelfSubdomain}.${domain0}/fullchain.pem";
    key = "${sslPath}/${audiobookshelfSubdomain}.${domain0}/key.pem";
  };
}

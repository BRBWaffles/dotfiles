{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain1
    servicePath
    sslPath
    sopsPath
    ;

  owncastLabel = "Owncast";
  owncastName = "owncast";
  owncastSubdomain = "stream";
in
{
  label = owncastLabel;
  name = owncastName;
  sops = {
    path0 = "${sopsPath}/${owncastName}";
  };
  subdomain = owncastSubdomain;
  paths = {
    path0 = "${servicePath}/${owncastLabel}";
    path1 = "/mnt/media/storage/${owncastName}";
  };
  ports = {
    port0 = 9454;
    port1 = 1935;
  };
  ssl = {
    cert = "${sslPath}/${owncastSubdomain}.${domain1}/fullchain.pem";
    key = "${sslPath}/${owncastSubdomain}.${domain1}/key.pem";
  };
}

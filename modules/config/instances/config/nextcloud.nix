{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain1
    servicePath
    sslPath
    sopsPath
    ;

  nextcloudLabel = "Nextcloud";
  nextcloudName = "nextcloud";
in
{
  label = nextcloudLabel;
  name = nextcloudName;
  sops = {
    path0 = "${sopsPath}/${nextcloudName}";
  };
  subdomain = nextcloudName;
  paths = {
    path0 = "${servicePath}/${nextcloudLabel}";
  };
  ports = {
    port0 = 8354; # Nextcloud
  };
  ssl = {
    cert = "${sslPath}/${nextcloudName}.${domain1}/fullchain.pem";
    key = "${sslPath}/${nextcloudName}.${domain1}/key.pem";
  };
}

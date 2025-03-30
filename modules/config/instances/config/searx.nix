{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain0
    servicePath
    sslPath
    sopsPath
    ;

  searxLabel = "SearXNG";
  searxName = "searx";
  searxSubdomain = "search";
in
{
  label = searxLabel;
  name = searxName;
  email = {
    address0 = "noreply@${domain0}";
  };
  sops = {
    path0 = "${sopsPath}/${searxName}";
  };
  subdomain = searxSubdomain;
  paths = {
    path0 = "${servicePath}/${searxLabel}";
  };
  ports = {
    port0 = 8888;
  };
  ssl = {
    cert = "${sslPath}/${searxSubdomain}.${domain0}/fullchain.pem";
    key = "${sslPath}/${searxSubdomain}.${domain0}/key.pem";
  };
}

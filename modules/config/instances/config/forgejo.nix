{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain3
    servicePath
    sslPath
    sopsPath
    ;

  forgejoLabel = "Forgejo";
  forgejoName = "forgejo";
  forgejoSubdomain = "source";
in
{
  label = forgejoLabel;
  name = forgejoName;
  email = {
    address0 = "noreply@${domain3}";
  };
  sops = {
    path0 = "${sopsPath}/${forgejoName}";
  };
  subdomain = forgejoSubdomain;
  paths = {
    path0 = "${servicePath}/${forgejoLabel}";
  };
  ports = {
    port0 = 3033;
  };
  ssl = {
    cert = "${sslPath}/${forgejoSubdomain}.${domain3}/fullchain.pem";
    key = "${sslPath}/${forgejoSubdomain}.${domain3}/key.pem";
  };
}

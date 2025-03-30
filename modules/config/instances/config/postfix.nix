{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain3
    servicePath
    sslPath
    sopsPath
    ;

  postfixLabel = "Postfix";
  postfixName = "postfix";
in
{
  label = postfixLabel;
  name = postfixName;
  sops = {
    path0 = "${sopsPath}/${postfixName}";
  };
  subdomain = postfixName;
  paths = {
    path0 = "${servicePath}/${postfixLabel}";
  };
  ssl = {
    cert = "${sslPath}/${domain3}/fullchain.pem";
    key = "${sslPath}/${domain3}/key.pem";
  };
}

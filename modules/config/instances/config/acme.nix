{ instancesFunctions }:
let
  inherit (instancesFunctions)
    sslPath
    sopsPath
    ;

  acmeLabel = "Acme";
  acmeName = "acme";
in
{
  label = acmeLabel;
  name = acmeName;
  paths = {
    path0 = sslPath;
  };
  sops = {
    path0 = "${sopsPath}/${acmeName}";
  };
}

{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain3
    sslPath
    sopsPath
    ;

  upRootNutritionLabel = "upRootNutrition";
  upRootNutritionName = "uprootnutrition";
in
{
  label = upRootNutritionLabel;
  name = upRootNutritionName;
  email = {
    address0 = "nick@${domain3}";
  };
  sops = {
    path0 = "${sopsPath}/${upRootNutritionName}";
  };
  paths = {
    path0 = "/var/lib/website/dist";
    path1 = "";
    path2 = "";
  };
  ports = {
    port0 = 1234;
  };
  ssl = {
    cert = "${sslPath}/${domain3}/fullchain.pem";
    key = "${sslPath}/${domain3}/key.pem";
  };
}

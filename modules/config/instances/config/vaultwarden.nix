{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain0
    servicePath
    sslPath
    sopsPath
    ;

  vaultwardenLabel = "Vaultwarden";
  vaultwardenName = "vaultwarden";
in
{
  label = vaultwardenLabel;
  name = vaultwardenName;
  email = {
    address0 = "noreply@${vaultwardenName}.${domain0}";
  };
  sops = {
    path0 = "${sopsPath}/${vaultwardenName}";
  };
  subdomain = vaultwardenName;
  paths = {
    path0 = "${servicePath}/${vaultwardenLabel}/BackupDir";
  };
  ports = {
    port0 = 8085; # Vaultwarden WebUI
  };
  ssl = {
    cert = "${sslPath}/${vaultwardenName}.${domain0}/fullchain.pem";
    key = "${sslPath}/${vaultwardenName}.${domain0}/key.pem";
  };
}

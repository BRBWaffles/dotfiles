{ instancesFunctions }:
let
  inherit (instancesFunctions)
    servicePath
    sopsPath
    ;

  postgresLabel = "PostgreSQL";
  postgresName = "postgres";
in
{
  label = postgresLabel;
  name = postgresName;
  sops = {
    path0 = "${sopsPath}/${postgresName}";
  };
  paths = {
    path0 = "${servicePath}/${postgresLabel}";
  };
  ports = {
    port0 = 5432;
  };
}

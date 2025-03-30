{ instancesFunctions }:
let
  inherit (instancesFunctions)
    servicePath
    sopsPath
    ;

  matrixLabel = "Matrix";
  matrixName = "matrix";
in
{
  label = matrixLabel;
  name = matrixName;
  sops = {
    path0 = "${sopsPath}/${matrixName}";
  };
  subdomain = matrixName;
  paths = {
    path0 = "${servicePath}/${matrixLabel}";
    path1 = "";
    path2 = "";
  };
}

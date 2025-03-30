{ instancesFunctions }:
let
  inherit (instancesFunctions)
    sopsPath
    ;

  synologyLabel = "Synology";
  synologyName = "synology";
in
{
  label = synologyLabel;
  name = synologyName;
  sops = {
    path0 = "${sopsPath}/${synologyName}";
  };
  ports = {
    port0 = 5001; # Synology HTTPS
  };
}

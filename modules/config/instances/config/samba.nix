{ instancesFunctions }:
let
  inherit (instancesFunctions)
    sopsPath
    ;

  sambaLabel = "Samba";
  sambaName = "samba";
in
{
  label = sambaLabel;
  name = sambaName;
  sops = {
    path0 = "${sopsPath}/${sambaName}";
  };
  paths = {
  };
  ports = {
    port0 = 445; # Samba
  };
}

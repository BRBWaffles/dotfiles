{ devicesFunctions }:
let
  inherit (devicesFunctions)
    ownerWriteOthersReadMask
    deimosIP
    ;
in
{
  label = "Deimos";
  name = "deimos";
  sync = {
    address0 = deimosIP;
  };
  ip = {
    address0 = deimosIP;
  };
  boot = {
    options = ownerWriteOthersReadMask;
  };
}

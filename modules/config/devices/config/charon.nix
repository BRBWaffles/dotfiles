{ devicesFunctions }:
let
  inherit (devicesFunctions)
    ownerExclusiveReadWriteMask
    charonIP
    ;
in
{
  label = "Charon";
  name = "charon";
  sync = {
    address0 = "";
  };
  ip = {
    address0 = charonIP;
  };
  boot = {
    options = ownerExclusiveReadWriteMask;
  };
}

{ devicesFunctions }:
let
  inherit (devicesFunctions)
    brotherIP
    dummy
    ;
in
{
  name = dummy;
  label = "Brother-HL-2170W";
  ip = {
    address0 = brotherIP;
  };
}

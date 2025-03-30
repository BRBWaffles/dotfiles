{ devicesFunctions }:
let
  inherit (devicesFunctions)
    phoneIP
    dummy
    ;
in
{
  name = "pixel";
  label = dummy;
  sync = {
    address0 = "RMDKNJY-BTX6FYF-G6SR332-WS6HARI-PF74SC6-VPBSGRQ-MKVQZEQ-KSIB6QV"; # User0
    address1 = "RUKSHY4-UCBYRVG-CVYFCMU-M3NLA3Q-JINRF5V-YPR5W32-TEIBJN6-DNQRCAR"; # User2
  };
  ip = {
    address0 = phoneIP;
  };
}

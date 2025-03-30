{ instancesFunctions }:
let
  inherit (instancesFunctions)
    dummy
    ;
in
{
  hostname = "mail.smtp2go.com";
  name = dummy;
  ports = {
    port0 = 2525;
  };
}

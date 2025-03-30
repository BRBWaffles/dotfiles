{ instancesFunctions }:
let
  inherit (instancesFunctions)
    sopsPath
    ;

  caddyLabel = "Caddy";
  caddyName = "caddy";
in
{
  label = caddyLabel;
  name = caddyName;
  sops = {
    path0 = "${sopsPath}/${caddyName}";
  };
  ports = {
    port0 = 80;
    port1 = 443;
  };
}

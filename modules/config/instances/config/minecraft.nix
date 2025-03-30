{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain0
    servicePath
    sslPath
    sopsPath
    ;

  minecraftLabel = "Minecraft";
  minecraftName = "minecraft";
in
{
  label = minecraftLabel;
  name = minecraftName;
  sops = {
    path0 = "${sopsPath}/${minecraftName}";
  };
  subdomain = minecraftName;
  paths = {
    path0 = "${servicePath}/${minecraftLabel}";
  };
  ports = {
    port0 = 43000; # Minecraft (Brix on Nix)
  };
  ssl = {
    cert = "${sslPath}/${minecraftName}.${domain0}/fullchain.pem";
    key = "${sslPath}/${minecraftName}.${domain0}/key.pem";
  };
}

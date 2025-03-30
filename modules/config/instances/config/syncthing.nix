{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain0
    sslPath
    sopsPath
    ;

  syncthingLabel = "Syncthing";
  syncthingName = "syncthing";
in
{
  label = syncthingLabel;
  name = syncthingName;
  sops = {
    path0 = "${sopsPath}/${syncthingName}";
  };
  subdomain = syncthingName;
  ports = {
    port0 = 8388; # Syncthing (WebUI)
    port1 = 21027; # Syncthing (Discovery)
    port2 = 22000; # Syncthing (Transfer)
  };
  ssl = {
    cert = "${sslPath}/${syncthingName}.${domain0}/fullchain.pem";
    key = "${sslPath}/${syncthingName}.${domain0}/key.pem";
  };
}

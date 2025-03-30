{ devicesFunctions }:
let
  inherit (devicesFunctions)
    readWritePermissions
    venusIP
    ;
  drivePath = "/run/media";
  byLabel = "/dev/disk/by-label";

in
{
  label = "Venus";
  name = "venus";
  ip = {
    address0 = venusIP;
  };
  boot = {
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };
  storage0 = {
    mount = "${drivePath}/games";
    device = "${byLabel}/Games";
    options = readWritePermissions;
  };
  storage1 = {
    mount = "${drivePath}/entertainment";
    device = "${byLabel}/Entertainment";
    options = readWritePermissions;
  };
}

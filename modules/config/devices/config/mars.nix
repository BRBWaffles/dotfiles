{ devicesFunctions }:
let
  inherit (devicesFunctions)
    ownerWriteOthersReadMask
    readWritePermissions
    marsIP
    ;
in
{
  label = "Mars";
  name = "mars";
  sync = {
    address0 = "";
  };
  ip = {
    address0 = marsIP;
  };
  boot = {
    options = ownerWriteOthersReadMask;
  };
  storage0 = {
    mount = "/mnt/media/games";
    device = "/dev/disk/by-label/Games";
    options = readWritePermissions;
  };
  storage1 = {
    mount = "/mnt/media/storage";
    device = "/dev/disk/by-label/Storage";
    options = readWritePermissions;
  };
}

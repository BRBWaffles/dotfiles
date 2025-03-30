{ devicesFunctions }:
let
  inherit (devicesFunctions)
    fileModeAndDirMode
    ownerExclusiveReadWriteMask
    readWritePermissions
    sambaPermissions
    userIdForUser0
    ceresIP
    ;
  ceresName = "ceres";
  ceresStorageDriveName = "NAS1";
in
{
  label = "Ceres";
  name = ceresName;
  sync = {
    address0 = "";
  };
  ip = {
    address0 = ceresIP;
  };
  boot = {
    options = ownerExclusiveReadWriteMask;
  };
  storage0 = {
    mount = "/mnt/media/${ceresStorageDriveName}";
    device = "/dev/disk/by-label/${ceresStorageDriveName}";
    options = readWritePermissions;
  };
  samba0 = {
    mount = "/mnt/media/${ceresName}";
    device = "//${ceresIP}";
    options = sambaPermissions ++ fileModeAndDirMode ++ userIdForUser0;
  };
}

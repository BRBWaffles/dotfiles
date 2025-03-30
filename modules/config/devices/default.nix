let
  configPath = ./config;
  printerPath = configPath + /printers;

  devicesFunctions = {
    ownerWriteOthersReadMask = [
      "fmask=0022"
      "dmask=0022"
    ];
    ownerExclusiveReadWriteMask = [
      "fmask=0077"
      "dmask=0077"
    ];
    readWritePermissions = [
      "rw"
    ];
    sambaPermissions = [
      "rw"
      "gid=100"
      "vers=3.0"
      "x-systemd.automount"
      "x-systemd.requires=network-online.target"
    ];
    fileModeAndDirMode = [
      "file_mode=0644"
      "dir_mode=0755"
    ];
    userIdForUser0 = [
      "uid=1000"
    ];
    userIdForUser1 = [
      "uid=1001"
    ];
    userIdForUser3 = [
      "uid=1002"
    ];
    dummy = [
    ];
    ceresIP = "192.168.50.140";
    charonIP = "192.168.50.42";
    deimosIP = "192.168.50.142";
    marsIP = "192.168.50.196";
    phoneIP = "192.168.50.243";
    synologyIP = "192.168.50.209";
    venusIP = "192.168.58.104";
    brotherIP = "192.168.50.195";
  };

  deviceswithFunctions = builtins.listToAttrs (
    map
      (name: {
        name = builtins.substring 0 (builtins.stringLength name - 4) name;
        value = import (configPath + "/${name}") {
          inherit
            devicesFunctions
            ;
        };
      })
      (
        builtins.filter (name: builtins.match ".*\\.nix$" name != null) (
          builtins.attrNames (builtins.readDir configPath)
        )
      )
  );

  devicesPrinters = builtins.listToAttrs (
    map
      (name: {
        name = builtins.substring 0 (builtins.stringLength name - 4) name;
        value = import (printerPath + "/${name}") {
          inherit
            devicesFunctions
            ;
        };
      })
      (
        builtins.filter (name: builtins.match ".*\\.nix$" name != null) (
          builtins.attrNames (builtins.readDir printerPath)
        )
      )
  );

  devices = deviceswithFunctions // devicesPrinters;
in
{
  devices = devices;
}

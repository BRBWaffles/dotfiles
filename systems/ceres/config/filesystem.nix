{
  flake,
  config,
  ...
}:
let
  inherit (flake.config.people)
    user0
    ;
  inherit (flake.config.machines.devices)
    ceres
    ;
in
{
  fileSystems =
    let
      storageDrives = [
        "storage0"
      ];

      storageMounts = storage: {
        name = "${ceres.${storage}.mount}";
        value = {
          device = ceres.${storage}.device;
          fsType = "ext4";
          options = ceres.${storage}.options;
        };
      };
    in
    {
      "/" = {
        device = "/dev/disk/by-uuid/de4e681b-0667-4bf8-8d6e-c50894aa41cd";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/C68D-B1C0";
        fsType = "vfat";
      };
    }
    // (builtins.listToAttrs (map storageMounts storageDrives));

  swapDevices = [
    { device = "/dev/disk/by-uuid/259fcc06-912c-4bd3-b781-8f77449e935a"; }
  ];

  systemd.tmpfiles.rules = [
    "Z ${config.home-manager.users.${user0}.home.homeDirectory} 0755 ${user0} users -"
    "Z ${ceres.storage0.mount} 2775 root root -"
  ];

  services.udisks2.enable = true;
}

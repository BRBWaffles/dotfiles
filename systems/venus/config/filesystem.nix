{
  config,
  flake,
  ...
}:
let
  inherit (flake.config.people) user2;
  inherit (flake.config.machines.devices) venus;
in
{
  imports = [ ];

  fileSystems =
    let
      storageDrives = [
        "storage0"
        "storage1"
      ];

      storageMounts = storage: {
        name = "${venus.${storage}.mount}";
        value = {
          device = venus.${storage}.device;
          fsType = "ext4";
          options = venus.${storage}.options;
        };
      };
    in
    {
      "/" = {
        device = "/dev/disk/by-uuid/d02cb367-26e0-4708-8840-75dcc4362ff4";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/22BD-5A25";
        fsType = "vfat";
        options = venus.boot.options;
      };
    }
    // (builtins.listToAttrs (map storageMounts storageDrives));

  swapDevices = [
    { device = "/dev/disk/by-uuid/cc7ab213-26c9-4567-91ca-9dba6e98c9d1"; }
  ];

  systemd.tmpfiles.rules = [
    "Z ${config.home-manager.users.${user2}.home.homeDirectory} 0755 ${user2} users -"
    "Z ${venus.storage0.mount} 0755 ${user2} users -"
    "Z ${venus.storage1.mount} 0755 ${user2} users -"
  ];

  services.udisks2.enable = true;
}

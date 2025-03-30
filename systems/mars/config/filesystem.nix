{
  flake,
  config,
  ...
}:
let
  inherit (flake.config.people) user0 user1 user3;
  inherit (flake.config.machines.devices) mars ceres synology;
  inherit (flake.config.services.instances) samba jellyfin audiobookshelf;
  synologySecrets = config.sops.secrets."network/synology".path;
  ceresSecrets = config.sops.secrets."network/server".path;
in
{
  fileSystems =
    let
      synologyDrives = [
        "folder0"
        "folder1"
        "folder2"
        "folder3"
      ];

      storageDrives = [
        "storage0"
        "storage1"
      ];

      sambaDrives = [
        "samba0"
      ];

      sambaFolders = [
        audiobookshelf.name
        jellyfin.name
      ];

      synologyMounts = synologyDrive: {
        name = "${synology.${synologyDrive}.mount}";
        value = {
          device = synology.${synologyDrive}.device;
          fsType = "cifs";
          options = synology.${synologyDrive}.options ++ [
            "credentials=${synologySecrets}"
          ];
        };
      };

      storageMounts = storageDrive: {
        name = "${mars.${storageDrive}.mount}";
        value = {
          device = mars.${storageDrive}.device;
          fsType = "ext4";
          options = mars.${storageDrive}.options;
        };
      };

      sambaMounts = sambaDrive: folder: {
        name = "${ceres.${sambaDrive}.mount}/${folder}";
        value = {
          device = "${ceres.${sambaDrive}.device}/${folder}";
          fsType = "cifs";
          options = ceres.${sambaDrive}.options ++ [
            "credentials=${ceresSecrets}"
          ];
        };
      };
    in
    {
      "/" = {
        device = "/dev/disk/by-uuid/1de87c26-c123-44c0-9c9b-6d2480bdeb7d";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/6A1F-3641";
        fsType = "vfat";
        options = mars.boot.options;
      };
    }
    // (builtins.listToAttrs (map synologyMounts synologyDrives))
    // (builtins.listToAttrs (map storageMounts storageDrives))
    // (builtins.listToAttrs (
      builtins.concatMap (drive: map (folder: sambaMounts drive folder) sambaFolders) sambaDrives
    ));

  swapDevices = [
    { device = "/dev/disk/by-uuid/8b1d43a7-baf8-4d15-a1ad-dc0c9dda6970"; }
  ];

  systemd.tmpfiles.rules = [
    "Z ${config.home-manager.users.${user0}.home.homeDirectory} 0755 ${user0} users -"
    "Z ${config.home-manager.users.${user1}.home.homeDirectory} 0755 ${user1} users -"
    "Z ${config.home-manager.users.${user3}.home.homeDirectory} 0755 ${user3} users -"
    "Z ${mars.storage0.mount} 0755 ${user0} users -"
    "Z ${mars.storage1.mount} 0755 ${user0} users -"
  ];

  services.udisks2.enable = true;
}

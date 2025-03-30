{
  flake,
  config,
  ...
}:
let
  inherit (flake.config.people)
    user0
    user1
    ;
  inherit (flake.config.machines.devices)
    deimos
    synology
    ceres
    ;
  inherit (flake.config.services.instances)
    samba
    jellyfin
    audiobookshelf
    ;

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
        device = "/dev/disk/by-uuid/c9a82c93-1da4-4cd1-a1fa-26483271a2bb";
        fsType = "ext4";
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/71CA-765A";
        fsType = "vfat";
        options = deimos.boot.options;
      };
    }
    // (builtins.listToAttrs (map synologyMounts synologyDrives))
    // (builtins.listToAttrs (
      builtins.concatMap (drive: map (folder: sambaMounts drive folder) sambaFolders) sambaDrives
    ));

  swapDevices = [
    { device = "/dev/disk/by-uuid/74007bf1-6e2f-425e-99fa-d35990f4ea37"; }
  ];

  systemd.tmpfiles.rules = [
    "Z ${config.home-manager.users.${user0}.home.homeDirectory} 0755 ${user0} users -"
    "Z ${config.home-manager.users.${user1}.home.homeDirectory} 0755 ${user1} users -"
  ];

  services.udisks2.enable = true;
}

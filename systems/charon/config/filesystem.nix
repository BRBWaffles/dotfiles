{
  flake,
  config,
  ...
}:
let
  inherit (flake.config.people) user1;
  inherit (flake.config.machines.devices) charon;
in
{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/0457d426-f166-4f35-b77b-93321dca2581";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/1703-D452";
      fsType = "vfat";
      options = charon.boot.options;
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/bedf4922-fa86-403a-846c-7d900dfb9086"; }
  ];

  systemd.tmpfiles.rules = [
    "Z ${config.home-manager.users.${user1}.home.homeDirectory} 0755 ${user1} users -"
  ];
}

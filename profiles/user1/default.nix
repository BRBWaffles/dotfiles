{
  config,
  flake,
  pkgs,
  ...
}:
let
  inherit (flake) self;
  inherit (flake.config.people) user1;
  inherit (flake.config.machines) devices;
  inherit (flake.config.people.users.${user1}) name;
  hostname = config.networking.hostName;
in
{
  users = {
    users.${user1} = {
      description = name;
      name = user1;
      isNormalUser = true;
      shell = pkgs.nushell;
      extraGroups = [
        "libvirtd"
        "disk"
        "networkmanager"
        "vboxusers"
        "wheel"
        "adbusers"
        "netdev"
      ];
    };
  };
  home-manager.users = {
    ${user1} = {
      home = {
        username = user1;
        homeDirectory = "/home/${user1}";
        file = {
          "./justfile" = {
            source = ./files/justfile;
          };
          "./.config/scripts/get_weather.sh" = {
            source = ./files/get_weather.sh;
            executable = true;
          };
          ".config/wallpaper" = {
            source = ./files/wallpaper;
            recursive = true;
          };
        };
        sessionVariables = { };
      };
      imports = [
        {
          home.stateVersion = config.system.stateVersion;
        }
        {
          imports = [
            self.homeModules."${devices.${hostname}.name}-${user1}"
          ];
        }
      ];
    };
  };
}

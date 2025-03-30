{
  config,
  flake,
  pkgs,
  lib,
  ...
}:
let
  inherit (flake) self;
  inherit (flake.config.people) user3;
  inherit (flake.config.machines) devices;
  inherit (flake.config.people.users.${user3}) name paths;
  hostname = config.networking.hostName;
in
{
  users = {
    users.${user3} = {
      description = name;
      name = user3;
      isNormalUser = true;
      shell = pkgs.nushell;
      extraGroups = [
        "adbusers"
        "disk"
        "libvirtd"
        "netdev"
        "networkmanager"
        "plugdev"
        "samba"
        "vboxusers"
        "wheel"
      ];
    };
  };
  home-manager.users = {
    ${user3} = {
      home = {
        username = user3;
        homeDirectory = "/home/${user3}";
        file = {
          "./.config/scripts/get_weather.sh" = {
            source = ./files/get_weather.sh;
            executable = true;
          };
          ".config/wallpaper" = {
            source = ./files/wallpaper;
            recursive = true;
          };
          "./.config/vesktop/themes/macchiato-theme.css" = {
            source = ./files/themes/vesktop/macchiato-theme.css;
          };
        };
        sessionVariables = {
          VISUAL = lib.getExe pkgs.zed-editor;
          GTK_THEME = "catppuccin-macchiato-mauve-compact";
        };
      };
      imports = [
        {
          home.stateVersion = config.system.stateVersion;
        }
        {
          imports = [
            self.homeModules."${devices.${hostname}.name}-${user3}"
          ];
        }
      ];
    };
  };
  systemd.tmpfiles = {
    rules =
      [
        "d ${paths.path0} 0755 ${user3} users -"
      ]
      ++ (map (path: "d /home/${user3}/${path} 0755 ${user3} users -") [
        "Files"
        "Files/Scripts"
        "Files/Games"
        "Files/Screenshots"
      ])
      ++ (map (path: "R /home/${user3}/${path} 0755 ${user3} users - -") [
        "Desktop"
        "Documents"
        "Music"
        "Pictures"
        "Public"
        "Templates"
        "Videos"
      ]);
  };
}

{
  config,
  flake,
  pkgs,
  lib,
  ...
}:
let
  inherit (flake) self;
  inherit (flake.config.people) user0;
  inherit (flake.config.machines) devices;
  inherit (flake.config.people.users.${user0}) name paths;
  hostname = config.networking.hostName;
in
{
  users = {
    users.${user0} = {
      description = name;
      name = user0;
      isNormalUser = true;
      shell = pkgs.nushell;
      extraGroups = [
        "adbusers"
        "caddy"
        "disk"
        "jellyfin"
        "libvirtd"
        "minecraft"
        "netdev"
        "networkmanager"
        "nextcloud"
        "ollama"
        "plugdev"
        "postgres"
        "redis-mastodon"
        "samba"
        "syncthing"
        "vaultwarden"
        "vboxusers"
        "wheel"
      ];
    };
  };
  home-manager.users = {
    ${user0} = {
      home = {
        username = user0;
        homeDirectory = "/home/${user0}";
        file = {
          "./justfile" = {
            text = ''
              vpn:
                  sudo protonvpn c --c CA

              vpnoff:
                  sudo protonvpn d

              rebuild:
                  nixos-rebuild switch --use-remote-sudo --flake ~/Files/Projects/dotfiles#${hostname} --show-trace

              elm:
                  cd ~/Files/Projects/website/frontend ; elm-land server

              server:
                  ssh ${devices.ceres.ip.address0}
            '';
          };
          "./Files/Scripts/list.sh" = {
            source = ./files/list.sh;
            executable = true;
          };
          "./Files/Scripts/loop.sh" = {
            source = ./files/loop.sh;
            executable = true;
          };
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
          "./.config/qBittorrent/themes/catppuccin-mocha.qbtheme" = {
            source = ./files/themes/qbittorrent/macchiato.qbtheme;
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
            self.homeModules."${devices.${hostname}.name}-${user0}"
          ];
        }
      ];
    };
  };
  systemd.tmpfiles = {
    rules =
      [
        "d ${paths.path0} 0755 ${user0} users -"
      ]
      ++ (map (path: "d /home/${user0}/${path} 0755 ${user0} users -") [
        "Downloads/Nicotine"
        "Downloads/Nicotine/Downloads"
        "Downloads/Nicotine/Incomplete"
        "Downloads/Nicotine/Received"
        "Downloads/Qbittorent"
        "Downloads/Qbittorent/Movies"
        "Downloads/Qbittorent/Music"
        "Downloads/Qbittorent/Shows"
        "Files"
        "Files/Scripts"
        "Files/Games"
        "Files/Screenshots"
      ])
      ++ (map (path: "R /home/${user0}/${path} 0755 ${user0} users - -") [
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

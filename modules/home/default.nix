{ config, ... }:
let
  inherit (import ../helpers.nix) directoryImport;
  modules = directoryImport ./.;
in
{
  flake.homeModules =
    let
      inherit (config.machines.devices)
        charon
        mars
        venus
        deimos
        ceres
        ;
      inherit (config.people)
        user0
        user1
        user2
        user3
        ;
    in
    {
      "${mars.name}-${user0}" = {
        imports = builtins.attrValues {
          inherit (modules)
            cli
            brave
            floorp
            tor
            ghostty
            prismLauncher
            steam
            zed
            vsCode
            feishin
            obsidian
            libreOffice
            okular
            zathura
            kolourPaint
            imageViewing
            daVinci
            mpv
            freetube
            dissent
            discordCanary
            vesktop
            element
            signal
            sharing
            bitwarden
            emote
            flameshot
            gnomeCalculator
            scrcpy
            systemMonitor
            usbImager
            virtManager
            # hypr
            # wayland
            theming
            polychromatic
            dolphin
            ;
        };
      };
      "${mars.name}-${user1}" = {
        imports = builtins.attrValues {
          inherit (modules)
            cli
            brave
            ghostty
            zed
            gaming
            spotify
            docs
            mpv
            kolourPaint
            discord
            signal
            scrcpy
            bitwarden
            emote
            desktop
            ;
        };
      };
      "${mars.name}-${user3}" = {
        imports = builtins.attrValues {
          inherit (modules)
            cli
            floorp
            ghostty
            steam
            zed
            obsidian
            okular
            kolourPaint
            imageViewing
            obsStudio
            mpv
            freetube
            vesktop
            bitwarden
            emote
            flameshot
            gnomeCalculator
            theming
            ;
        };
      };
      "${venus.name}-${user2}" = {
        imports = builtins.attrValues {
          inherit (modules)
            cli
            firefox
            brave
            code
            ghostty
            gaming
            spotify
            audioProduction
            wpsOffice
            obsidian
            okular
            images
            modeling
            obsStudio
            kdenlive
            videoPlaying
            discord
            signal
            tdesktop
            teams
            whatsApp
            zoom
            tools
            ;
        };
      };
      "${deimos.name}-${user0}" = {
        imports = builtins.attrValues {
          inherit (modules)
            cli
            brave
            floorp
            tor
            ghostty
            prismLauncher
            steam
            zed
            feishin
            obsidian
            libreOffice
            okular
            zathura
            kolourPaint
            imageViewing
            obsStudio
            daVinci
            mpv
            freetube
            dissent
            discordCanary
            vesktop
            element
            signal
            sharing
            bitwarden
            emote
            flameshot
            gnomeCalculator
            scrcpy
            systemMonitor
            usbImager
            virtManager
            # hypr
            # wayland
            theming
            polychromatic
            dolphin
            ;
        };
      };
      "${deimos.name}-${user1}" = {
        imports = builtins.attrValues {
          inherit (modules)
            cli
            brave
            ghostty
            zed
            gaming
            spotify
            docs
            mpv
            kolourPaint
            discord
            signal
            scrcpy
            bitwarden
            emote
            # hypr
            # wayland
            theming
            ;
        };
      };
      "${charon.name}-${user1}" = {
        imports = builtins.attrValues {
          inherit (modules)
            cli
            brave
            ghostty
            zed
            gaming
            spotify
            docs
            mpv
            jellyfin
            kolourPaint
            systemMonitor
            discord
            signal
            scrcpy
            bitwarden
            emote
            gnome
            theming
            ;
        };
      };
      "${ceres.name}-${user0}" = {
        imports = builtins.attrValues {
          inherit (modules)
            cli
            tooling
            ;
        };
      };
    };
}

let
  inherit (import ../helpers.nix) directoryImport;
  modules = directoryImport ./.;
in
{
  flake.nixosModules = {
    mars = {
      imports = builtins.attrValues {
        inherit (modules)
          mullvad
          syncthing
          ollama
          # hypr
          searx
          portals
          xserver
          flatpak
          plasma
          sddm
          ;
      };
    };

    venus = {
      imports = builtins.attrValues {
        inherit (modules)
          plasma
          sddm
          tablet
          ;
      };
    };

    deimos = {
      imports = builtins.attrValues {
        inherit (modules)
          # hypr
          # wayland
          plasma
          sddm
          flatpak
          xserver
          ;
      };
    };

    charon = {
      imports = builtins.attrValues {
        inherit (modules)
          gnome
          flatpak
          xserver
          ;
      };
    };

    ceres = {
      imports = builtins.attrValues {
        inherit (modules)
          acme
          audiobookshelf
          caddy
          jellyfin
          logrotate
          mastodon
          minecraft
          ollama
          website
          postgresql
          samba
          searx
          vaultwarden
          forgejo
          xserver
          ;
      };
    };

    mantle = {
      imports = builtins.attrValues {
        inherit (modules)
          sops
          ;
      };
    };

    crust = {
      imports = builtins.attrValues {
        inherit (modules)
          hardware
          programs
          ;
      };
    };

    core = {
      imports = builtins.attrValues {
        inherit (modules)
          core
          ;
      };
    };
  };
}

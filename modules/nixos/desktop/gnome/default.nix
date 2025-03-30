{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
        gdm.wayland = true;
      };
      desktopManager.gnome = {
        enable = true;
      };
    };
    gnome = {
      games.enable = false;
      gnome-online-accounts.enable = true;
    };
    udev.packages = builtins.attrValues {
      inherit (pkgs)
        gnome-settings-daemon
        ;
    };
    gvfs.enable = true;
  };
  environment = {
    variables = {
      # WEBKIT_FORCE_SANDBOX = "0";
      # WEBKIT_DISABLE_COMPOSITING_MODE = "1";
    };
    gnome.excludePackages = builtins.attrValues {
      inherit (pkgs)
        gnome-photos
        gnome-tour
        epiphany # web browser
        cheese # webcam tool
        geary # email reader
        evince # document viewer
        totem # video player
        yelp # help viewer
        gnome-calendar
        atomix # puzzle game
        gnome-clocks
        gnome-weather
        gnome-maps
        gnome-contacts
        gnome-characters
        gnome-music
        tali # poker game
        iagno # go game
        hitori # sudoku game
        ;
    };
  };
  programs.dconf.enable = true;
}

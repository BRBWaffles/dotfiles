{ pkgs, ... }:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      gnome-connections
      gnome-tweaks
      gnome-shell-extensions
      gnome-remote-desktop
      ulauncher
      ;
    inherit (pkgs.gnomeExtensions)
      tiling-shell
      keep-awake
      notification-banner-reloaded
      no-overview
      wallpaper-slideshow
      dash-to-panel
      just-perfection
      appindicator
      tiling-assistant
      start-overlay-in-application-view
      ;
  };
}

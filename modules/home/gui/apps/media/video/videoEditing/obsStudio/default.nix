{ pkgs, ... }:
{
  programs = {
    obs-studio = {
      enable = true;
      plugins = builtins.attrValues {
        inherit (pkgs.obs-studio-plugins)
          wlrobs
          obs-tuna
          obs-vkcapture
          obs-multi-rtmp
          obs-webkitgtk
          ;
      };
    };
  };
  home = {
    file = {
      "./.config/obs-studio/themes" = {
        source = ./themes;
      };
    };
  };
}

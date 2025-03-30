{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = [
      pkgs.xfce.thunar-archive-plugin
      pkgs.xfce.thunar-volman
      pkgs.xfce.thunar-media-tags-plugin
    ];
  };
}

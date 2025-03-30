{ pkgs, ... }:
{
  qt = {
    enable = true;
    style = {
      package = pkgs.catppuccin-qt5ct;
    };
  };
}

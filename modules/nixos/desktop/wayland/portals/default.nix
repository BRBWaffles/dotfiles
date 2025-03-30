{ pkgs, flake, ... }:
{
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  xdg = {
    portal = {
      enable = true;
      wlr.enable = true;
      config.common.default = "*";
      xdgOpenUsePortal = true;
      extraPortals = builtins.attrValues {
        inherit (pkgs)
          xdg-desktop-portal-gtk
          # xdg-desktop-portal-hyprland
          xdg-desktop-portal-wlr
          ;
      };
    };
  };

}

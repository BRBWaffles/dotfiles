{
  pkgs,
  flake,
  ...
}:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = flake.inputs.hyprland.packages.${pkgs.system}.hyprland;
    # portalPackage = flake.inputs.hyprland-portal.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
  nix = {
    settings = {
      substituters = [
        "https://hyprland.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
  };
  environment = {
    variables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      WLR_DRM_NO_ATOMIC = "1";
      FLAMESHOT_ENABLE_WAYLAND = "1";
      USE_WAYLAND_GRIM = "1";
      USE_WAYLAND_CLIPBOARD = "1";
    };
  };
}

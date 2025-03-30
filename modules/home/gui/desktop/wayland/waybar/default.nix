{
  config,
  flake,
  pkgs,
  ...
}:
let
  configPath = ./config;
  settingsPath = import (configPath + /settings.nix) { inherit config; };
  stylePath = import (configPath + /style.nix) { inherit config flake; };
in
{
  programs.waybar = {
    enable = true;
    # package = flake.inputs.waybar.packages.${pkgs.system}.default;
    settings = settingsPath;
    style = stylePath;
  };
}

{
  config,
  flake,
  pkgs,
  osConfig,
  ...
}:
let
  configPath = ./config;
  settingsPath = import (configPath + /settings.nix) {
    inherit
      flake
      config
      osConfig
      pkgs
      ;
  };
  themesPath = import (configPath + /themes.nix) { inherit config flake; };
in
{
  programs.ghostty = {
    enable = true;
    package = flake.inputs.ghostty.packages.${pkgs.system}.default;
    settings = settingsPath;
    themes = themesPath;
  };
}

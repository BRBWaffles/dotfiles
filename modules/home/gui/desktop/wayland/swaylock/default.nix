{
  config,
  flake,
  ...
}:
let
  configPath = ./config;
  settingsPath = import (configPath + /settings.nix) { inherit config flake; };
in
{
  programs.swaylock = {
    enable = true;
    settings = settingsPath;
  };
}

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
  programs.tofi = {
    enable = true;
    settings = settingsPath;
  };
}

{
  flake,
  config,
  lib,
  ...
}:
let
  configPath = ./config;
  settingsPath = import (configPath + /settings.nix) { inherit config flake lib; };
in
{
  programs.starship = {
    enable = true;
    settings = settingsPath;
  };
}

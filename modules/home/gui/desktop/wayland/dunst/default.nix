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
  services.dunst = {
    enable = true;
    settings = settingsPath;
  };
}

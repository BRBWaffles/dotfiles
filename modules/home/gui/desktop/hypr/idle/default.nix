let
  configPath = ./config;
  settingsPath = import (configPath + /settings.nix);
in
{
  services.hypridle = {
    enable = true;
    settings = settingsPath;
  };
}

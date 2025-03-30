let
  configPath = ./config;
  settingsPath = import (configPath + /settings.nix);
in
{
  programs.fastfetch = {
    enable = true;
    settings = settingsPath;
  };
}

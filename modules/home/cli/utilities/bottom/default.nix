{
  flake,
  config,
  ...
}:
{
  programs.bottom =
    let
      configPath = ./config;
      settingsPath = import (configPath + /settings.nix) { inherit config flake; };
    in
    {
      enable = true;
      settings = settingsPath;
    };
}

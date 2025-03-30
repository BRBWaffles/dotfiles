{
  programs.freetube =
    let
      configPath = ./config;
      settingsPath = import (configPath + /settings.nix);
    in
    {
      enable = true;
      settings = settingsPath;
    };
}

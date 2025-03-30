{
  pkgs,
  flake,
  ...
}:
{
  programs.helix =
    let
      configPath = ./config;
      settingsPath = import (configPath + /settings.nix);
      languagesPath = import (configPath + /languages.nix);
    in
    {
      enable = true;
      package = flake.inputs.helix.packages.${pkgs.system}.default;
      languages = languagesPath;
      settings = settingsPath;
    };
}

{
  pkgs,
  lib,
  flake,
  ...
}:
{
  programs = {
    vscode =
      let
        configPath = ./config;
        keybindingsPath = import (configPath + /keybindings.nix);
        extensionsPath = import (configPath + /extensions.nix) {
          inherit
            pkgs
            ;
        };
        userSettingsPath = import (configPath + /userSettings.nix) {
          inherit
            pkgs
            lib
            flake
            ;
        };
      in
      {
        enable = true;
        package = pkgs.vscode;
        profiles.default = {
          keybindings = keybindingsPath;
          extensions = extensionsPath;
          userSettings = userSettingsPath;
        };
      };
  };
}

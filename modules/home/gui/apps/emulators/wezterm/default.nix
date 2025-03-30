{ flake, ... }:
{
  programs.wezterm =
    let
      configPath = ./config;
      extraConfigPath = import (configPath + /extraConfig.nix) {
        inherit
          flake
          ;
      };
    in
    {
      enable = true;
      extraConfig = extraConfigPath;
    };
}

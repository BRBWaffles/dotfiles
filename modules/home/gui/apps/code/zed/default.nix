{
  config,
  flake,
  lib,
  pkgs,
  ...
}:
let
  configPath = ./config;
  extensionsPath = import (configPath + /extensions);
  userKeymapsPath = import (configPath + /userKeymaps);
  userSettingsPath = import (configPath + /userSettings) {
    inherit
      config
      flake
      lib
      pkgs
      ;
  };
  extraPackagesPath = import (configPath + /extraPackages) { inherit pkgs; };
  packagePath = flake.inputs.zed-editor.packages.${pkgs.system}.default;
in
{
  programs.zed-editor = {
    enable = true;
    # package = packagePath;
    extraPackages = extraPackagesPath;
    extensions = extensionsPath;
    userKeymaps = userKeymapsPath;
    userSettings = userSettingsPath;
  };
}

{
  flake,
  pkgs,
  ...
}:
{
  programs.yazi =
    let
      configPath = ./config;
      keymapPath = import (configPath + /keymap.nix);
      settingsPath = import (configPath + /settings.nix);
    in
    {
      enable = true;
      # package = flake.inputs.yazi.packages.${pkgs.system}.yazi;
      enableNushellIntegration = true;
      keymap = keymapPath;
      settings = settingsPath;
    };
  # Keymap
  # https://github.com/sxyazi/yazi/blob/main/yazi-config/preset/keymap.toml
}

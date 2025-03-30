{
  programs.brave =
    let
      configPath = ./config;
      extensionsPath = import (configPath + /extensions.nix);
    in
    {
      enable = true;
      extensions = extensionsPath;
    };
}

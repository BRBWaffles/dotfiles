{
  flake,
  lib,
  pkgs,
  ...
}:
let
  configPath = ./config;
  assistantPath = import (configPath + /assistant) { inherit flake; };
  interfacePath = import (configPath + /interface) { inherit flake; };
  languagesPath = import (configPath + /languages);
  lspPath = import (configPath + /lsp);
  terminalPath = import (configPath + /terminal) { inherit flake; };
  # experimentalPath = import (configPath + /theme) { inherit config flake; };
  gitPath = import (configPath + /git);
  miscPath = import (configPath + /misc) { inherit lib pkgs; };
in
{
  git = gitPath;
  languages = languagesPath;
  lsp = lspPath;
  terminal = terminalPath;
  # experimental.theme_overrides = experimentalPath;

}
// assistantPath
// interfacePath
// miscPath

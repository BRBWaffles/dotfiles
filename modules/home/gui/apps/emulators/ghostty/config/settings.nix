{
  flake,
  osConfig,
  pkgs,
  ...
}:
let
  inherit (flake.config.aesthetics.themes) fonts;
in
{
  confirm-close-surface = false;
  window-decoration = true;
  font-size = fonts.sizes.terminal.size0;
  font-family = fonts.names.name0;
  window-padding-x = 10;
  window-padding-y = 10;
  copy-on-select = true;
  bold-is-bright = true;
  shell-integration = "detect";
  command = "${pkgs.nushell}/bin/nu";
}

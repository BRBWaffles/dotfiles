{
  flake,
  ...
}:
let
  inherit (flake.config.aesthetics.themes)
    fonts
    ;
in
{
  programs.kitty = {
    enable = true;
    font = {
      name = fonts.names.name0;
      size = fonts.sizes.terminal.size0;
    };
    themeFile = "Catppuccin-Macchiato";
  };
}

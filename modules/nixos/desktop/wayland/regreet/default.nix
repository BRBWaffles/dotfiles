{
  pkgs,
  flake,
  lib,
  ...
}:
let
  inherit (flake.config.aesthetics.themes)
    fonts
    ;
in
{
  programs.regreet = {
    enable = false;
    package = pkgs.greetd.regreet;
    # settings = {
    #   appearance = {
    #     greeting_msg = "Back for more, I see.";
    #   };
    #   GTK = {
    #     application_prefer_dark_theme = true;
    #     cursor_theme_name = lib.mkForce "catppuccin-macchiato-dark-cursors";
    #     font_name = lib.mkForce "${fonts.names.name0} ${font.size.desktop}";
    #     icon_theme_name = lib.mkForce "Papirus-Dark";
    #     theme_name = lib.mkForce "catppuccin-macchiato-mauve-compact";
    #   };
    # };
    # theme = {
    #   name = "catppuccin-macchiato-mauve-compact";
    #   package = pkgs.catppuccin-gtk.override {
    #     size = "compact";
    #     variant = "macchiato";
    #     accents = [
    #       "mauve"
    #     ];
    #   };
    # };
    # cursorTheme = {
    #   name = "catppuccin-macchiato-dark-cursors";
    #   package = pkgs.catppuccin-cursors.macchiatoDark;
    # };
    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.catppuccin-papirus-folders.override {
    #     flavor = "macchiato";
    #     accent = "mauve";
    #   };
    # };
  };
}

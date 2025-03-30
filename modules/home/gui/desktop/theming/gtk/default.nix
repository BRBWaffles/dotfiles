{ pkgs, flake, ... }:
let
  inherit (flake.config.aesthetics.themes) cursor;
in
{
  gtk = {
    enable = true;
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
    cursorTheme = {
      name = "catppuccin-macchiato-dark-cursors";
      package = pkgs.catppuccin-cursors.macchiatoDark;
      size = cursor.size;
    };
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "macchiato";
        accent = "mauve";
      };
      name = "Papirus-Dark";
    };
    theme = {
      package = pkgs.catppuccin-gtk.override {
        size = "compact";
        variant = "macchiato";
        accents = [
          "mauve"
        ];
      };
      name = "catppuccin-macchiato-mauve-compact";
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "catppuccin-mocha-dark-cursors";
    package = pkgs.catppuccin-cursors.macchiatoDark;
    size = cursor.size;
  };
}

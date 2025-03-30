let
  currentTheme0 = catppuccin-mocha; # User0 Theme
  currentTheme1 = catppuccin-mocha; # User1 Theme
  currentTheme2 = catppuccin-mocha; # User2 Theme

  brogrammer = "brogrammer";
  catppuccin-frappe = "catppuccin-frappe";
  catppuccin-latte = "catppuccin-latte";
  catppuccin-macchiato = "catppuccin-macchiato";
  catppuccin-mocha = "catppuccin-mocha";
  chalk = "chalk";
  deep-oceanic-next = "deep-oceanic-next";
  dracula = "dracula";
  espresso = "espresso";
  flat = "flat";
  framer = "framer";
  github = "github";
  hardcore = "hardcore";
  one-black = "one-black";
  one-dark = "one-dark";
  one-light = "one light";
  sparky = "sparky";

in
{
  themes = {
    currentTheme = {
      theme0 = currentTheme0; # User0 Theme
      theme1 = currentTheme1; # User1 Theme
      theme2 = currentTheme2; # User2 Theme
    };
    cursor = {
      name = "";
      size = 18;
    };
    fonts = {
      names = {
        name0 = "MonaspiceNe Nerd Font"; # User0 Font
        name1 = ""; # User1 Font
        name2 = ""; # User2 Font
      };
      sizes = {
        applications = {
          size0 = 14; # User0 Size
          size1 = 14; # User1 Size
          size2 = 14; # User2 Size
        };
        desktop = {
          size0 = 12; # User0 Size
          size1 = 12; # User1 Size
          size2 = 12; # User2 Size
        };
        popups = {
          size0 = 10; # User0 Size
          size1 = 10; # User1 Size
          size2 = 10; # User2 Size
        };
        terminal = {
          size0 = 10; # User0 Size
          size1 = 10; # User1 Size
          size2 = 10; # User2 Size
        };
      };
    };
    palettes =
      let
        palettePath = ./palettes;
        catppuccinPath = /catppuccin;
        onePath = /one;
      in
      {
        ${brogrammer} = import (palettePath + /brogrammer);
        ${catppuccin-frappe} = import (palettePath + catppuccinPath + /frappe);
        ${catppuccin-latte} = import (palettePath + catppuccinPath + /latte);
        ${catppuccin-macchiato} = import (palettePath + catppuccinPath + /macchiato);
        ${catppuccin-mocha} = import (palettePath + catppuccinPath + /mocha);
        ${chalk} = import (palettePath + /chalk);
        ${deep-oceanic-next} = import (palettePath + /deep-oceanic-next);
        ${dracula} = import (palettePath + /dracula);
        ${espresso} = import (palettePath + /espresso);
        ${flat} = import (palettePath + /flat);
        ${framer} = import (palettePath + /framer);
        ${github} = import (palettePath + /github);
        ${hardcore} = import (palettePath + /hardcore);
        ${one-black} = import (palettePath + onePath + /black);
        ${one-dark} = import (palettePath + onePath + /dark);
        ${one-light} = import (palettePath + onePath + /light);
        ${sparky} = import (palettePath + /sparky);

      };
  };
}

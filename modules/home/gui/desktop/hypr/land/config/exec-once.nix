{ flake, ... }:
let
  inherit (flake.config.aesthetics.themes)
    cursor
    ;
  scarlettOut = "pactl set-default-sink alsa_output.usb-Focusrite_Scarlett_2i2_USB_Y818KFJ0C671CE-00.HiFi__Line1__sink";
  scarlettIn = "pactl set-default-source alsa_input.usb-Focusrite_Scarlett_2i2_USB_Y818KFJ0C671CE-00.HiFi__Mic1__source";
  catppuccin = [
    "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
    "gsettings set org.gnome.desktop.interface cursor-theme 'catppuccin-mocha-dark-cursors'"
    "gsettings set org.gnome.desktop.interface cursor-size ${builtins.toString cursor.size}"
  ];
in
[
  "swaylock"
  "hypridle"
  "wl-clipboard"
  "wpaperd"
  "gammastep"
  "dunst"
  "playerctrld"
  "waybar"
  "nm-applet"
  "blueman-applet"
  "rfkill block bluetooth"
  "rfkill unblock bluetooth"
  "easyeffects -r"
  "emote"
  "flameshot"
  scarlettIn
  scarlettOut
]
++ catppuccin

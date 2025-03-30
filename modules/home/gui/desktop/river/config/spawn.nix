{ flake, ... }:
let
  inherit (flake.config.aesthetics.themes)
    cursor
    ;
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
  "easyeffects -r"
  "emote"
  "flameshot"
  "pactl set-default-sink bluez_output.00_16_94_35_0D_5F.1"
  "pactl set-default-source alsa_input.usb-Focusrite_Scarlett_2i2_USB_Y818KFJ0C671CE-00.HiFi__Mic1__source"
  "bluetoothctl power on"
  "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
  "gsettings set org.gnome.desktop.interface cursor-theme 'catppuccin-mocha-dark-cursors'"
  "gsettings set org.gnome.desktop.interface cursor-size ${builtins.toString cursor.size}"
  "nmcli connection delete pvpn-killswitch-ipv6"
]

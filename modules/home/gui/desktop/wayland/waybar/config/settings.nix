{ config, ... }:
let
  user = config.home.username;
in
{
  mainBar = {
    position = "bottom";
    layer = "top";
    height = 5;
    margin-top = 0;
    margin-bottom = 5;
    margin-left = 5;
    margin-right = 5;
    modules-left = [
      "custom/launcher"
      "hyprland/workspaces"
    ];

    modules-center = [
      "custom/weather"
    ];

    modules-right = [
      "tray"
      "privacy"
      "cpu"
      "memory"
      "disk"
      "pulseaudio"
      # "network"
      "battery"
      "clock"
    ];

    clock = {
      calendar = {
        format = {
          today = "<span color='#ff6699'><b><u>{}</u></b></span>";
        };
      };
      format = " {:%H:%M}";
      tooltip = true;
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = " {:%d/%m}";
    };

    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        "1" = "◉";
        "2" = "◉";
        "3" = "◉";
        "4" = "◉";
        "5" = "◉";
        urgent = "";
        default = "◉";
        sort-by-number = true;
      };
      persistent-workspaces = {
        "1" = [ ];
        "2" = [ ];
        "3" = [ ];
        "4" = [ ];
        "5" = [ ];
      };
    };

    memory = {
      format = "󰟜 {}%";
      format-alt = "󰟜 {used} GiB"; # 
      interval = 2;
    };

    cpu = {
      format = "  {usage}%";
      format-alt = "  {avg_frequency} GHz";
      interval = 2;
    };

    disk = {
      # path = "/";
      format = "󰋊 {percentage_used}%";
      interval = 60;
    };

    network = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰀂 ";
      tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnected = "󰖪 ";
    };

    tray = {
      icon-size = 12;
      spacing = 8;
    };

    pulseaudio = {
      format = "{icon} {volume}%";
      tooltip = false;
      format-muted = " Muted";
      on-click = "easyeffects";
      on-scroll-up = "pactl set-sink-volume alsa_output.usb-Focusrite_Scarlett_2i2_USB_Y818KFJ0C671CE-00.HiFi__Line1__sink +5% ; pactl set-sink-volume @DEFAULT_SINK@ 5%";
      on-scroll-down = "pactl set-sink-volume alsa_output.usb-Focusrite_Scarlett_2i2_USB_Y818KFJ0C671CE-00.HiFi__Line1__sink -5% ; pactl set-sink-volume @DEFAULT_SINK@ -5%";
      scroll-step = 5;
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = [
          ""
          ""
          ""
        ];
      };
    };
    "custom/launcher" = {
      format = "";
      on-click = "rm -r /home/$USER/.cache/tofi* ; tofi-drun";
      # on-click-right = "pkill tofi || wallpaper-picker";
      tooltip = false;
    };

    privacy = {
      icon-spacing = 8;
      icon-size = 12;
      transition-duration = 250;
      modules = {
        screenshare = {
          type = "screenshare";
          tooltip = true;
          tooltip-icon-size = 12;
        };
        audio-out = {
          type = "audio-out";
          tooltip = true;
          tooltip-icon-size = 12;
        };
        audio-in = {
          type = "audio-in";
          tooltip = true;
          tooltip-icon-size = 12;
        };
      };
    };

    "custom/weather" = {
      exec = "/home/${user}/.config/scripts/get_weather.sh Winnipeg";
      return-type = "json";
      format = "{}";
      tooltip = true;
      interval = 3600;
    };
    battery = {
      format = "{icon} {capacity}%";
      format-alt = "{icon} {time}";
      format-charging = " {capacity}%";
      format-icons = [
        ""
        ""
        ""
        ""
        ""
      ];
      format-plugged = " {capacity}%";
      states = {
        critical = 15;
        warning = 30;
      };
    };
  };
}
# https://unicodes.jessetane.com/

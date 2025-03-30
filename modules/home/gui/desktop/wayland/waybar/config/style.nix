{
  config,
  flake,
  ...
}:
let

  inherit (flake.config.aesthetics.themes) currentTheme palettes fonts;

  inherit (flake.config.people) user0 user1 user2;

  user = config.home.username;

  themeLogic =
    if user == user0 then
      currentTheme.theme0
    else if user == user1 then
      currentTheme.theme1
    else if user == user2 then
      currentTheme.theme2
    else
      currentTheme.theme0;

  el = palettes.${themeLogic}.colours;

  custom = {
    font = fonts.names.name0;
    font_size = "${builtins.toString fonts.sizes.desktop.size0}px";
    font_weight = "bold";
    opacityBg = "0.90";
    opacityBt = "1";
    text_color = el.base0E;
    secondary_accent = el.base07;
    tertiary_accent = el.base15;
    button_color = el.base04;
    background_1 = el.base01;
    background_2 = el.base00;
    background_3 = el.base04;
  };
in
''

    * {
        min-height: 0px;
        font-family: ${custom.font};
        font-weight: ${custom.font_weight};
    }

    window#waybar {
        background: #${custom.background_2};
        color: #${custom.background_3};
        border: 2px solid;
        border-radius: 30px;
        border-color: #${custom.text_color};
        min-height: 100px;
        opacity: ${custom.opacityBg};
  }

    #workspaces {
        font-size: 18px;
        padding-left: 15px;
        margin-bottom: 2px;
    }
    #workspaces button {
        color: #${custom.button_color};
        padding: 5px;
        opacity: ${custom.opacityBt};
    }
    #workspaces button.empty {
        color: #${custom.background_3};
    }
    #workspaces button.active {
        color: #${custom.text_color};
    }

    #tray, #pulseaudio, #privacy, #cpu, #memory, #disk, #clock {
        font-size: ${custom.font_size};
        color: #${custom.text_color};
        padding-right: 10px;
    }

    #privacy {
    }

    #cpu {
    }

    #memory {
    }

    #disk {
    }

    #tray {
    }

    #pulseaudio {
    }

    #clock {
    }

    #battery {
        font-size: ${custom.font_size};
        color: #${custom.text_color};
        padding-right: 10px;
    }

    #custom-launcher {
        font-size: 20px;
        color: #${custom.text_color};
        font-weight: ${custom.font_weight};
        padding-left: 10px;
    }

    #custom-weather {
        font-size: 14px;
        color: #${custom.text_color};
        font-weight: ${custom.font_weight};
    }
''

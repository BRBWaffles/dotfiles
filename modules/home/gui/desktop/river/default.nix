{
  flake,
  config,
  pkgs,
  ...
}:
let
  inherit (flake.config.aesthetics.themes) cursor;
  configPath = ./config;
  settingsPath = {
    spawn = import (configPath + /spawn.nix) { inherit config flake; };
    map = import (configPath + /map.nix);
  };
in
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      rivercarro
      ;
  };

  services.kanshi = {
    enable = true;
    systemdTarget = "river-session.target";
  };

  wayland.windowManager.river = {
    enable = true;
    xwayland.enable = true;
    settings = {
      border-width = 4;
      declare-mode = [
        "locked"
        "normal"
        "passthrough"
      ];
      input = {
        pointer-foo-bar = {
          accel-profile = "flat";
          events = true;
          pointer-accel = -0.3;
          tap = false;
        };
      };
      rule-add = {
        "-app-id" = {
          "'bar'" = "csd";
          "'float*'" = {
            "-title" = {
              "'foo'" = "float";
            };
          };
        };
      };
      set-cursor-warp = "on-output-change";
      set-repeat = "50 300";
      map-pointer = {
        normal = {
          "Alt BTN_LEFT" = "move-view";
          "Super BTN_LEFT" = "resize-view";
          "Super F" = "toggle-float";
        };
      };
      default-layout = "rivercarro";
      attach-mode = "bottom";
      map.normal = settingsPath.map;
      spawn = settingsPath.spawn;
    };
    systemd = {
      enable = true;
      extraCommands = [
        "systemctl --user stop river-session.target"
        "systemctl --user start river-session.target"
      ];
    };
  };
}

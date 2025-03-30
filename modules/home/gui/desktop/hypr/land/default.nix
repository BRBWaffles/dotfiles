{
  flake,
  config,
  pkgs,
  ...
}:
let

  inherit (flake.config.people) user0;
  user = config.home.username;

  configPath = ./config;
  configImports = {
    animations = import (configPath + /animations.nix);
    bindm = import (configPath + /bindm.nix);
    binds = import (configPath + /binds.nix);
    # bindl = import (configPath + /bindl.nix);
    decoration = import (configPath + /decoration.nix);
    dwindle = import (configPath + /dwindle.nix);
    exec-once = import (configPath + /exec-once.nix) { inherit flake; };
    general = import (configPath + /general.nix) { inherit config flake; };
    input = import (configPath + /input.nix);
    misc = import (configPath + /misc.nix);
    windowrulev2 = import (configPath + /windowrulev2.nix);
    xwayland = import (configPath + /xwayland.nix);
    monitor = import (configPath + /monitor.nix);
    bind =
      let
        bindConfig =
          if user == user0 then
            import (configPath + /bind-user0.nix)
          else
            import (configPath + /bind-user1.nix);
      in
      bindConfig;
  };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    xwayland.enable = true;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      extraCommands = [
        "systemctl --user stop hyprland-session.target"
        "systemctl --user start hyprland-session.target"
      ];
    };
    settings = configImports;
  };
}

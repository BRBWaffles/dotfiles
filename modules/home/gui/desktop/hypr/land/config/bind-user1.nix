let
  superBinds = builtins.map (x: "SUPER, " + x) [
    # Apps
    "B, exec, brave"
    "E, exec, ghostty -e nu -e y"
    "S, exec, steam"
    "N, exec, signal-desktop"
    "D, exec, discordcanary"
    "R, exec, flatpak run org.vinegarhq.Sober"
    "T, exec, ghostty"
    "P, exec, spotify"
    "M, exec, prismlauncher"
    "J, exec, jellyfinmediaplayer"
    "L, exec, lutris"
    # Workspaces
    "1, workspace, 1"
    "2, workspace, 2"
    "3, workspace, 3"
    "4, workspace, 4"
    "5, workspace, 5"
    # Windows
    "X, killactive"
    "bracketright, splitratio, 0.33"
    "bracketleft, splitratio, -0.33"
    "Tab, fullscreen, 0"
    "F, togglefloating"
    # Window Focus
    "left, movefocus, l"
    "up, movefocus, u"
    "down, movefocus, d"
    "right, movefocus, r"
    # Audio
    "PageUp, exec, playerctl next"
    "PageDown, exec, playerctl previous"
    "Home, exec, playerctl play-pause"
    "Space, exec, rm -r /home/$USER/.cache/tofi* ; tofi-drun"
  ];

  superShiftBinds = builtins.map (x: "SUPER SHIFT, " + x) [
    # Super+shift binds
    # Window Move
    "left, movewindow, l"
    "up, movewindow, u"
    "down, movewindow, d"
    "right, movewindow, r"
    # Quick Action
    "S, exec, flameshot gui"
    "period, exec, emote"
    "Backspace, layoutmsg, togglesplit"
    "P, pin, enable"
    # "Print, exec, grim -g \"$(slurp)\""
    # Utility
    "End, exec, shutdown now"
    "Insert, exec, systemctl reboot"
    "Home, exec, swaylock"
    "1, movetoworkspacesilent, 1"
    "2, movetoworkspacesilent, 2"
    "3, movetoworkspacesilent, 3"
    "4, movetoworkspacesilent, 4"
    "5, movetoworkspacesilent, 5"
  ];
  superCtrlBinds = builtins.map (x: "SUPER CTRL, " + x) [
    # Super+shift binds
  ];

  altBinds = builtins.map (x: "ALT, " + x) [
    # Alt binds
  ];

  shiftBinds = builtins.map (x: "SHIFT, " + x) [
    # Shift binds
  ];

  ctrlBinds = builtins.map (x: "CTRL, " + x) [
    # Ctrl binds
  ];

  ctrlShiftBinds = builtins.map (x: "CTRL SHIFT, " + x) [
    # Ctrl+shift binds
    # "End, exec, shutdown now"
  ];
in
superBinds
++ superShiftBinds
++ superCtrlBinds
++ altBinds
++ ctrlBinds
++ ctrlShiftBinds
++ shiftBinds
# Docs
# https://wiki.hyprland.org/Getting-Started/Master-Tutorial/

let
  superBinds = builtins.map (x: "SUPER, " + x) [
    # Apps
    "Z, exec, obsidian"
    "L, exec, slack"
    "H, exec, feishin"
    "G, exec, scrcpy"
    "K, exec, ghostty -e nu -e y"
    "S, exec, steam"
    "R, exec, ghostty -e zellij a dotfiles"
    "N, exec, signal-desktop"
    "T, exec, zeditor"
    "B, exec, floorp"
    "X, exec, freetube"
    "V, exec, discordcanary"
    "M, exec, element-desktop"
    "D, exec, ghostty"
    "P, exec, bitwarden"
    # Workspaces
    "1, workspace, 1"
    "2, workspace, 2"
    "3, workspace, 3"
    "4, workspace, 4"
    "5, workspace, 5"
    # Windows
    "Tab, killactive"
    # Window Focus
    "C, movefocus, l"
    "A, movefocus, u"
    "E, movefocus, d"
    "I, movefocus, r"
    "F, splitratio, 0.33"
    "O, splitratio, -0.33"
    # Audio
    "PageUp, exec, playerctl next"
    "PageDown, exec, playerctl previous"
    "Home, exec, playerctl play-pause"
    "Space, exec, rm -r /home/$USER/.cache/tofi* ; tofi-drun"
  ];

  superShiftBinds = builtins.map (x: "SUPER SHIFT, " + x) [
    # Super+shift binds

    # Quick Action
    "T, exec, ghostty"
    "S, exec, flameshot gui"
    "period, exec, emote"
    "Tab, fullscreen, 0"
    "Backspace, layoutmsg, togglesplit"
    "P, pin, enable"
    "F, togglefloating"
    # "Print, exec, grim -g \"$(slurp)\""
    # Utility
    "End, exec, shutdown now"
    "Insert, exec, systemctl reboot"
    "Home, exec, swaylock"
  ];
  superCtrlBinds = builtins.map (x: "SUPER CTRL, " + x) [
    # Super+shift binds

  ];

  altBinds = builtins.map (x: "CTRL ALT, " + x) [
    # Alt binds
    "1, movetoworkspacesilent, 1"
    "2, movetoworkspacesilent, 2"
    "3, movetoworkspacesilent, 3"
    "4, movetoworkspacesilent, 4"
    "5, movetoworkspacesilent, 5"
    # Window Move
    "C, movewindow, l"
    "A, movewindow, u"
    "E, movewindow, d"
    "I, movewindow, r"
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

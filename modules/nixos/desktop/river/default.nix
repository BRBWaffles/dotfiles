{
  programs.river = {
    enable = true;
    xwayland.enable = true;
  };
  environment = {
    loginShellInit = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec river
      fi
    '';
    sessionVariables = {
      XDG_CURRENT_DESKTOP = "river";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "river";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      _JAVA_AWT_WM_NONEREPARENTING = "1";
      WLR_DRM_NO_ATOMIC = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };

}

let
  blueman = "(.blueman-manager-wrapped)";
  calculator = "(org.gnome.Calculator)";
  easyeffects = "(com.github.wwmm.easyeffects)";
  floorp = "(floorp)";
  nomacs = "(org.nomacs.ImageLounge)";
  mpv = "(mpv)";
  vlc = "(vlc)";
  emote = "(emote)";
  flameshot = "(flameshot)";
  bitwarden = "(.*Bitwarden.*)";
  save = "(.*Enter name of file to save to….*)";
  proton = "(.*.protonvpn-app-wrapped.*)";
  picture = "(.*Picture-in-Picture.*)";
  discord-popout = "(.*Discord Popout.*)";
  upload = "(.*File Upload.*)";
  signal = "(signal)";
  vesktop = "(vesktop)";
  code = "(code)";
  feishin = "(feishin)";
  steam = "(steam)";
  kdenlive = "(org.kde.kdenlive)";
  shotcut = "(shotcut)";
  scrcpy = "(.scrcpy-wrapped)";
  battle = "(.*Battle.net.*)";

  maxsizeWindows = [
    "maxsize 720 400, class:^${blueman}$"
    "maxsize 360 500, class:^${calculator}$"
    "maxsize 720 400, class:^${easyeffects}$"
    # "maxsize 720 400, class:^${scrcpy}$"
    "maxsize 720 400, class:^${mpv}$"
    "maxsize 720 400, class:^${vlc}$"
    "maxsize 640 360, class:^${nomacs}$"
    "maxsize 1000 600, class:^${proton}$"
    "maxsize 800 450, title:^${bitwarden}$"
    "maxsize 720 400, title:^${picture}$"
    "maxsize 720 400, title:^${save}$"
    "maxsize 720 400, title:^${discord-popout}$"
    "maxsize 1280 720, title:^${battle}$"
    "minsize 1280 720, title:^${battle}$"
    "maxsize 1280 720, title:^${upload}$"
    "minsize 1280 720, title:^${upload}$"
  ];

  floatWindows = builtins.map (x: "float, " + x) [
    "class:^${blueman}$"
    "class:^${calculator}$"
    "class:^${easyeffects}$"
    "class:^${emote}$"
    "class:^${mpv}$"
    "class:^${vlc}$"
    "class:^${nomacs}$"
    "class:^${flameshot}$"
    # "class:^${scrcpy}$"
    "class:^${nomacs}$"
    "class:^${proton}$"
    "title:^(${picture})$"
    "title:^(${discord-popout})$"
    "title:^${bitwarden}$"
    "title:^${save}$"
    "title:^${battle}$"
    "title:^${upload}$"
  ];

  pinWindows = builtins.map (x: "pin, " + x) [
    "title:^${picture}$"
    "title:^${discord-popout}$"
  ];

  idleInhibit = builtins.map (x: "idleinhibit, " + x) [
    "fullscreen, class:^${floorp}$"
  ];

  workspaceInit1 = builtins.map (x: "workspace 1 silent, " + x) [
    "class:^${signal}$"
    "class:^${vesktop}$"
  ];

  workspaceInit2 = builtins.map (x: "workspace 2 silent, " + x) [
    "class:^${code}$"
    # "class:^${floorp}$"
  ];

  workspaceInit3 = builtins.map (x: "workspace 3 silent, " + x) [
    "class:^${steam}$"
    "class:^${shotcut}$"
  ];

  workspaceInit4 = builtins.map (x: "workspace 4 silent, " + x) [
    "class:^${feishin}$"
    "class:^${scrcpy}$"
  ];

  centerWindows = builtins.map (x: "center, " + x) [
    "class:^${blueman}$"
    "class:^${calculator}$"
    "class:^${easyeffects}$"
    "class:^${emote}$"
    "class:^${mpv}$"
    "class:^${vlc}$"
    "class:^${nomacs}$"
    "class:^${flameshot}$"
    # "class:^${scrcpy}$"
    "title:^(${picture})$"
    "title:^(${discord-popout})$"
    "title:^${bitwarden}$"
    "title:^${save}$"
    "title:^${battle}$"
    "title:^${upload}$"
  ];

  opaqueWindows = builtins.map (x: "opaque, " + x) [
    "class:^${floorp}$"
    "class:^${kdenlive}$"
    "class:^(krita)$"
    "class:^${shotcut}$"
    "class:^${mpv}$"
    "class:^(Brave-browser)$"
    "class:^(Gimp-2.10)$"
    "class:^(org.kde.okular)$"
    "class:^${vlc}$"
  ];
in
maxsizeWindows
++ floatWindows
++ pinWindows
++ idleInhibit
++ workspaceInit1
++ workspaceInit2
++ workspaceInit3
++ workspaceInit4
++ centerWindows
++ opaqueWindows

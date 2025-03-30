{
  flake,
  config,
  ...
}:
let

  inherit (flake.config.aesthetics.themes)
    currentTheme
    palettes
    fonts
    ;

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

  makeColor = c: "#" + c;
in
{
  global = {
    font = "${fonts.names.name0} ${builtins.toString fonts.sizes.popups.size0}";
    background = makeColor el.base01;
    frame_color = makeColor el.base0E;
    foreground = makeColor el.base05;
    corner_radius = 10;
    fade_in_duration = 1000;
    frame = 10000;
    frame_width = 1;
    icon_corner_radius = 10;
    monitor = 1;
    offset = "20x20";
    origin = "bottom-right";
    progress_bar_corner_radius = 4;
    timeout = 10;
    transparecncy = true;
  };

  urgency_critical = {
    frame_color = makeColor el.base09;
    timeout = 0;
  };
  skip-rule = {
    appname = "flameshot";
    skip_display = true;
  };
}

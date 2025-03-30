{
  config,
  flake,
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
in
{
  font = fonts.names.name0;
  font-size = fonts.sizes.desktop.size0;
  indicator-idle-visible = true;
  indicator-radius = 100;
  indicator-thickness = 20;
  show-failed-attempts = true;

  bs-hl-color = el.base08;
  color = el.base01;
  key-hl-color = el.base0E;

  caps-lock-bs-hl-color = el.base08;
  caps-lock-key-hl-color = el.base0E;

  inside-color = el.base01;
  inside-clear-color = el.base01;
  inside-caps-lock-color = el.base01;
  inside-ver-color = el.base01;
  inside-wrong-color = el.base01;

  line-color = el.base01;
  line-clear-color = el.base01;
  line-caps-lock-color = el.base01;
  line-ver-color = el.base01;
  line-wrong-color = el.base01;

  ring-color = el.base00;
  ring-clear-color = el.base00;
  ring-caps-lock-color = el.base00;
  ring-ver-color = el.base00;
  ring-wrong-color = el.base00;

  separator-color = "00000000";

  text-color = el.base05;
  text-clear-color = el.base05;
  text-caps-lock-color = el.base05;
  text-ver-color = el.base05;
  text-wrong-color = el.base05;
}

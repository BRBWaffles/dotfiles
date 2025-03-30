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
in
{
  font-size = fonts.sizes.desktop.size0;
  hint-font = true;
  background-color = "#${el.base02}";
  outline-color = "#${el.base0E}";
  prompt-color = "#${el.base0D}";
  input-color = "#${el.base07}";
  default-result-color = "#${el.base05}";
  selection-color = "#${el.base0E}";
  prompt-text = "Summon: ";

  width = 400;
  height = 400;

  outline-width = 1;
  border-width = 0;

  padding-top = 10;
  padding-bottom = 10;
  padding-left = 10;
  padding-right = 10;

  corner-radius = 10;

  drun-launch = true;
}

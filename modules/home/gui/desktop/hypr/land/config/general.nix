{
  config,
  flake,
  ...
}:
let

  inherit (flake.config.aesthetics.themes) currentTheme palettes;

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
  gaps_in = 5;
  gaps_out = 5;
  border_size = 2;
  "col.active_border" = "rgb(${el.base0E})";
  "col.inactive_border" = "0xff${el.base02}";

}

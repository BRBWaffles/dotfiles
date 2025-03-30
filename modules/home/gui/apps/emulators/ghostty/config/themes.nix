{
  flake,
  config,
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
  theme = {
    background = el.base01;
    cursor-color = el.base06;
    foreground = el.base05;
    palette = [
      "0=${el.base03}"
      "1=${el.base08}"
      "2=${el.base0B}"
      "3=${el.base0A}"
      "4=${el.base0D}"
      "5=${el.base17}"
      "6=${el.base0C}"
      "7=${el.base05}"
      "8=${el.base04}"
      "9=${el.base08}"
      "10=${el.base03}"
      "11=${el.base0A}"
      "12=${el.base0D}"
      "13=${el.base17}"
      "14=${el.base0C}"
      "15=${el.base05}"
    ];
    selection-background = el.base04;
    selection-foreground = el.base05;
  };
}

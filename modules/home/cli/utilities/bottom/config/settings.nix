{
  flake,
  config,
  ...
}:
let
  inherit (flake.config.aesthetics.themes)
    currentTheme
    palettes
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
  colors = {
    tableHeaderColor = el.base06;
    allCpuColor = el.base06;
    avgCpuColor = el.base12;
    cpuCoreColors = [
      el.base07
      el.base16
      el.base09
      el.base0A
      el.base0B
      el.base15
      el.base0E
    ];
    ramColor = el.base0B;
    swapColor = el.base09;
    rxColor = el.base0B;
    txColor = el.base08;
    widgetTitleColor = el.base0F;
    borderColor = el.base04;
    highlightedBorderColor = el.base17;
    textColor = el.base05;
    graphColor = el.base05;
    cursorColor = el.base17;
    selectedTextColor = el.base11;
    selectedBgColor = el.base0E;
    highBatteryColor = el.base0B;
    mediumBatteryColor = el.base0A;
    lowBatteryColor = el.base08;
    gpuCoreColors = [
      el.base15
      el.base0E
      el.base08
      el.base09
      el.base0A
      el.base0B
    ];
    arcColor = el.base15;
  };
}

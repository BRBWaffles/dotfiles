{
  flake,
  config,
  lib,
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

  makeColor = c: "#" + c;
  makeStyle = bg: fg: "bg:" + bg + " fg:" + fg + " bold";
  surround =
    fg: text:
    "[](fg:"
    + makeColor el.base00
    + " bg:"
    + fg
    + ")"
    + "[█](fg:"
    + fg
    + ")"
    + text
    + "[█](fg:"
    + fg
    + ")";
in
{
  add_newline = false;
  character =
    let
      makeChar =
        bg: c:
        surround (makeColor bg) ("[" + c + "](" + makeStyle (makeColor bg) (makeColor el.base11) + ")");
    in
    {
      error_symbol = makeChar el.base12 "⊥";
      format = "$symbol";
      success_symbol = makeChar el.base0C "λ";
    };
  cmd_duration = {
    format = surround (makeColor el.base0E) "[ $duration]($style)";
    min_time = 0;
    show_milliseconds = true;
    style = makeStyle (makeColor el.base0E) (makeColor el.base11);
  };
  directory = {
    format = surround (makeColor el.base0D) "[󰉋 $path]($style)[$read_only]($read_only_style)";
    read_only = "  ";
    read_only_style = makeStyle (makeColor el.base0D) (makeColor el.base11);
    style = makeStyle (makeColor el.base0D) (makeColor el.base11);
    truncation_length = 1;
    truncate_to_repo = false;
  };
  git_branch = {
    format = surround (makeColor el.base09) "[$symbol $branch]($style)";
    style = makeStyle (makeColor el.base09) (makeColor el.base11);
    symbol = "";
  };
  git_status = {
    format = "[ \\[$all_status$ahead_behind\\]]($style)";
    style = makeStyle (makeColor el.base0A) (makeColor el.base11);
  };
  hostname = {
    format = surround (makeColor el.base16) "[$ssh_symbol$hostname]($style)";
    ssh_symbol = "󰖟 ";
    style = makeStyle (makeColor el.base16) (makeColor el.base11);
  };
  pijul_channel = {
    disabled = false;
    format = surround (makeColor el.base09) "[$symbol $channel]($style)";
    style = makeStyle (makeColor el.base09) (makeColor el.base11);
    symbol = "";
  };
  format = lib.concatStrings [
    "$hostname"
    "$directory"
    "$pijul_channel"
    "$git_branch"
    "$cmd_duration"
    "$character "
  ];
}

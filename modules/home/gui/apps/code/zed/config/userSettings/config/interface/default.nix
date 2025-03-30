{ flake, ... }:
let
  inherit (flake.config.aesthetics.themes)
    fonts
    ;
in
{
  ui_font_family = fonts.names.name0;
  buffer_font_family = fonts.names.name0;
  hour_format = "hour12";
  vim_mode = false;
  show_whitespaces = "none";
  ui_font_size = fonts.sizes.applications.size0;
  buffer_font_size = fonts.sizes.applications.size0;
  tab_size = 2;
  cursor_blink = true;
  theme = "Catppuccin Macchiato";
  show_copilot_suggestions = true;
  bracket_pairing = "always";
  relative_line_numbers = true;
  tabs = {
    file_icons = true;
    git_status = true;
  };
  inlay_hints = {
    enabled = true;
    typeHints = true;
    parameterHints = true;
    chainingHints = true;
  };
  project_panel = {
    file_icons = true;
    folder_icons = true;
    indent_size = 15;
    auto_reveal_entries = false;
    auto_fold_dirs = false;
  };
  indent_guides = {
    enabled = true;
  };
}

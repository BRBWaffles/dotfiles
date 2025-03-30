{ flake, ... }:
let
  inherit (flake.config.aesthetics.themes)
    fonts
    ;
in
{
  alternate_scroll = "off";
  blinking = "off";
  copy_on_select = true;
  dock = "bottom";
  detect_venv = {
    on = {
      directories = [
        ".env"
        "env"
        ".venv"
        "venv"
      ];
      activate_script = "default";
    };
  };

  env = {
    TERM = "ghostty";
  };

  font_family = fonts.names.name0;
  font_features = null;
  font_size = fonts.sizes.terminal.size0;
  line_height = "comfortable";
  option_as_meta = false;
  button = false;
  shell = "system";
  toolbar = {
    title = false;
  };
  working_directory = "current_project_directory";
}

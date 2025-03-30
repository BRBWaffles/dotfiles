{ flake, ... }:
let
  inherit (flake.config.aesthetics.themes)
    fonts
    ;
in
''
  return {
    color_scheme = "Catppuccin Macchiato",
    font_size = ${builtins.toString fonts.sizes.terminal.size0},
    font = wezterm.font('${fonts.names.name0}'),
    enable_tab_bar = false,
    window_close_confirmation = 'NeverPrompt',
    term = 'wezterm',
    enable_wayland = true,
    front_end = "WebGpu",
    max_fps = 200
  }
''

{
  editor = {
    mouse = true;
    auto-format = true;
    soft-wrap.enable = true;
    auto-save = true;
    line-number = "relative";
    cursorline = true;
    indent-guides = {
      character = "╎";
      skip-levels = 1;
      render = true;
    };
    lsp = {
      display-messages = true;
      display-inlay-hints = true;
    };
  };

  keys = {
    normal = {
      f = ":format";
      tab = "indent";
      S-tab = "unindent";
      ret = [
        "add_newline_below"
        "move_line_down"
      ];
      S-ret = [
        "add_newline_above"
        "move_line_up"
      ];
      S-up = [
        "extend_to_line_bounds"
        "delete_selection"
        "move_line_up"
        "paste_before"
      ];

      S-down = [
        "extend_to_line_bounds"
        "delete_selection"
        "paste_after"
      ];
      S-g = [
        ":write-all"
        ":new"
        ":insert-output lazygit"
        ":buffer-close!"
        ":redraw"
        ":reload-all"
      ];
      Y = "yank_main_selection_to_primary_clipboard";
      R = "replace_selections_with_primary_clipboard";
      space = {
        q = ":q";
        w = ":w";
      };
    };
  };
  theme = "catppuccin_macchiato";
}

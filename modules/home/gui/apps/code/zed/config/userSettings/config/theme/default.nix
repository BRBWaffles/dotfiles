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
  accents = [
    "${el.base0E}66"
    "${el.base07}66"
    "${el.base16}66"
    "${el.base0B}66"
    "${el.base0A}66"
    "${el.base09}66"
    "${el.base08}66"
  ];

  border = {
    value = "#${el.base02}";
    variant = "#${el.base0E}";
    focused = "#${el.base07}";
    selected = "#${el.base0E}";
    transparent = "#${el.base0B}";
    disabled = "#${el.base03}";
  };

  elevated_surface.background = "#${el.base01}";
  surface.background = "#${el.base01}";
  background = {
    value = "#${el.base00}";
    appearance = "opaque";
  };
  element = {
    background = "#${el.base11}";
    hover = "#${el.base03}4d";
    active = "#${el.base04}4d";
    selected = "#${el.base02}4d";
    disabled = "#${el.base03}";
  };

  drop_target.background = "#${el.base02}66";
  ghost_element = {
    background = "#${el.base11}59";
    hover = "#${el.base03}4d";
    active = "#${el.base04}99";
    selected = "#${el.base05}1a";
    disabled = "#${el.base03}";
  };

  text = {
    value = "#${el.base05}";
    muted = "#${el.base05}";
    placeholder = "#${el.base04}";
    disabled = "#${el.base03}";
    accent = "#${el.base0E}";
  };

  icon = {
    value = "#${el.base05}";
    muted = "#${el.base04}";
    disabled = "#${el.base03}";
    placeholder = "#${el.base04}";
    accent = "#${el.base0E}";
  };

  status_bar.background = "#${el.base11}";
  title_bar = {
    background = "#${el.base11}";
    inactive_background = "#${el.base11}d9";
  };
  toolbar.background = "#${el.base00}";
  tab_bar.background = "#${el.base11}";
  tab = {
    inactive_background = "#${el.base11}";
    active_background = "#${el.base00}";
  };

  search.match_background = "#${el.base0C}33";
  panel = {
    background = "#${el.base01}";
    focused_border = "#${el.base05}";
    indent_guide = "#${el.base02}99";
    indent_guide_active = "#${el.base04}";
    indent_guide_hover = "#${el.base0E}";
  };

  pane.focused_border = "#${el.base05}";
  pane_group.border = "#${el.base02}";

  scrollbar = {
    thumb = {
      background = "#${el.base0E}33";
      hover_background = "#${el.base03}";
      border = "#${el.base0E}";
      scrollbar.track.background = null;
    };
    track.border = "#${el.base05}12";
  };

  editor = {
    foreground = "#${el.base05}";
    background = "#${el.base00}";
    gutter.background = "#${el.base00}";
    subheader.background = "#${el.base01}";
    active_line.background = "#${el.base05}0d";
    highlighted_line.background = null;
    line_number = "#${el.base04}";
    active_line_number = "#${el.base0E}";
    invisible = "#${el.base05}66";
    wrap_guide = "#${el.base04}";
    active_wrap_guide = "#${el.base04}";
    document_highlight = {
      bracket_background = "#${el.base06}40";
      read_background = "#${el.base05}29";
      write_background = "#${el.base05}29";
    };
    indent_guide = "#${el.base02}99";
    indent_guide_active = "#${el.base04}";
  };

  terminal = {
    background = "#${el.base00}";
    ansi.background = "#${el.base00}";
    foreground = "#${el.base05}";
    dim_foreground = "#${el.base04}";
    bright_foreground = "#${el.base05}";
  };

  link_text.hover = "#${el.base15}";

  conflict = {
    value = "#${el.base0A}";
    border = "#${el.base0A}";
    background = "#${el.base01}";
  };

  created = {
    value = "#${el.base0B}";
    border = "#${el.base0B}";
    background = "#${el.base01}";
  };

  deleted = {
    value = "#${el.base08}";
    border = "#${el.base08}";
    background = "#${el.base01}";
  };

  hidden = {
    value = "#${el.base03}";
    border = "#${el.base03}";
    background = "#${el.base01}";
  };

  hint = {
    value = "#${el.base04}";
    border = "#${el.base04}";
    background = "#${el.base01}";
  };

  ignored = {
    value = "#${el.base03}";
    border = "#${el.base03}";
    background = "#${el.base01}";
  };

  modified = {
    value = "#${el.base0A}";
    border = "#${el.base0A}";
    background = "#${el.base01}";
  };

  predictive = {
    value = "#${el.base03}";
    border = "#${el.base07}";
    background = "#${el.base01}";
  };

  renamed = {
    value = "#${el.base16}";
    border = "#${el.base16}";
    background = "#${el.base01}";
  };

  info = {
    value = "#${el.base0C}";
    border = "#${el.base0C}";
    background = "#${el.base05}33";
  };

  warning = {
    value = "#${el.base0A}";
    border = "#${el.base0A}";
    background = "#${el.base0A}1f";
  };

  error = {
    value = "#${el.base08}";
    border = "#${el.base08}";
    background = "#${el.base08}1f";
  };

  success = {
    value = "#${el.base0B}";
    border = "#${el.base0B}";
    background = "#${el.base0B}1f";
  };

  unreachable = {
    value = "#${el.base08}";
    border = "#${el.base08}";
    background = "#${el.base08}1f";
  };

  players = [
    {
      cursor = "#${el.base06}";
      selection = "#${el.base04}80";
      background = "#${el.base06}";
    }
    {
      cursor = "#${el.base0E}";
      selection = "#${el.base0E}33";
      background = "#${el.base0E}";
    }
    {
      cursor = "#${el.base07}";
      selection = "#${el.base07}33";
      background = "#${el.base07}";
    }
    {
      cursor = "#${el.base16}";
      selection = "#${el.base16}33";
      background = "#${el.base16}";
    }
    {
      cursor = "#${el.base0B}";
      selection = "#${el.base0B}33";
      background = "#${el.base0B}";
    }
    {
      cursor = "#${el.base0A}";
      selection = "#${el.base0A}33";
      background = "#${el.base0A}";
    }
    {
      cursor = "#${el.base09}";
      selection = "#${el.base09}33";
      background = "#${el.base09}";
    }
    {
      cursor = "#${el.base08}";
      selection = "#${el.base08}33";
      background = "#${el.base08}";
    }
  ];

  syntax = {
    variable = {
      color = "#${el.base05}";
      font_style = null;
      font_weight = null;
    };
    variable.builtin = {
      color = "#${el.base08}";
      font_style = null;
      font_weight = null;
    };
    variable.parameter = {
      color = "#${el.base12}";
      font_style = null;
      font_weight = null;
    };
    variable.member = {
      color = "#${el.base0D}";
      font_style = null;
      font_weight = null;
    };
    variable.special = {
      color = "#${el.base17}";
      font_style = "italic";
      font_weight = null;
    };

    constant = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };
    constant.builtin = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };
    constant.macro = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };

    module = {
      color = "#${el.base0A}";
      font_style = "italic";
      font_weight = null;
    };

    label = {
      color = "#${el.base16}";
      font_style = null;
      font_weight = null;
    };

    string = {
      color = "#${el.base0B}";
      font_style = null;
      font_weight = null;
    };
    string.documentation = {
      color = "#${el.base0C}";
      font_style = null;
      font_weight = null;
    };
    string.regexp = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };
    string.escape = {
      color = "#${el.base17}";
      font_style = null;
      font_weight = null;
    };
    string.special = {
      color = "#${el.base17}";
      font_style = null;
      font_weight = null;
    };
    string.special.path = {
      color = "#${el.base17}";
      font_style = null;
      font_weight = null;
    };
    string.special.symbol = {
      color = "#${el.base0F}";
      font_style = null;
      font_weight = null;
    };
    string.special.url = {
      color = "#${el.base06}";
      font_style = "italic";
      font_weight = null;
    };

    character = {
      color = "#${el.base0C}";
      font_style = null;
      font_weight = null;
    };
    character.special = {
      color = "#${el.base17}";
      font_style = null;
      font_weight = null;
    };

    boolean = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };

    number = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };
    number.float = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };

    type = {
      color = "#${el.base0A}";
      font_style = null;
      font_weight = null;
    };
    type.builtin = {
      color = "#${el.base0E}";
      font_style = "italic";
      font_weight = null;
    };
    type.definition = {
      color = "#${el.base0A}";
      font_style = null;
      font_weight = null;
    };
    type.interface = {
      color = "#${el.base0A}";
      font_style = "italic";
      font_weight = null;
    };
    type.super = {
      color = "#${el.base0A}";
      font_style = "italic";
      font_weight = null;
    };

    attribute = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };

    property = {
      color = "#${el.base0D}";
      font_style = null;
      font_weight = null;
    };

    function = {
      color = "#${el.base0D}";
      font_style = null;
      font_weight = null;
    };
    function.builtin = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };
    function.call = {
      color = "#${el.base0D}";
      font_style = null;
      font_weight = null;
    };
    function.macro = {
      color = "#${el.base0C}";
      font_style = null;
      font_weight = null;
    };
    function.method = {
      color = "#${el.base0D}";
      font_style = null;
      font_weight = null;
    };
    function.method.call = {
      color = "#${el.base0D}";
      font_style = null;
      font_weight = null;
    };
    constructor = {
      color = "#${el.base0F}";
      font_style = null;
      font_weight = null;
    };

    operator = {
      color = "#${el.base15}";
      font_style = null;
      font_weight = null;
    };

    keyword = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.modifier = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.type = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.coroutine = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.function = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.operator = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.import = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.repeat = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.return = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.debug = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.exception = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.conditional = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.conditional.ternary = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };
    keyword.directive = {
      color = "#${el.base17}";
      font_style = null;
      font_weight = null;
    };
    keyword.directive.define = {
      color = "#${el.base17}";
      font_style = null;
      font_weight = null;
    };
    keyword.export = {
      color = "#${el.base15}";
      font_style = null;
      font_weight = null;
    };

    punctuation = {
      color = "#${el.base05}";
      font_style = null;
      font_weight = null;
    };
    punctuation.delimiter = {
      color = "#${el.base05}";
      font_style = null;
      font_weight = null;
    };
    punctuation.bracket = {
      color = "#${el.base05}";
      font_style = null;
      font_weight = null;
    };
    punctuation.special = {
      color = "#${el.base17}";
      font_style = null;
      font_weight = null;
    };
    punctuation.special.symbol = {
      color = "#${el.base0F}";
      font_style = null;
      font_weight = null;
    };
    punctuation.list_marker = {
      color = "#${el.base0C}";
      font_style = null;
      font_weight = null;
    };

    comment = {
      color = "#${el.base05}";
      font_style = "italic";
      font_weight = null;
    };
    comment.doc = {
      color = "#${el.base05}";
      font_style = "italic";
      font_weight = null;
    };
    comment.documentation = {
      color = "#${el.base05}";
      font_style = "italic";
      font_weight = null;
    };
    comment.error = {
      color = "#${el.base08}";
      font_style = "italic";
      font_weight = null;
    };
    comment.warning = {
      color = "#${el.base0A}";
      font_style = "italic";
      font_weight = null;
    };
    comment.hint = {
      color = "#${el.base0D}";
      font_style = "italic";
      font_weight = null;
    };
    comment.todo = {
      color = "#${el.base0F}";
      font_style = "italic";
      font_weight = null;
    };
    comment.note = {
      color = "#${el.base06}";
      font_style = "italic";
      font_weight = null;
    };

    diff.plus = {
      color = "#${el.base0B}";
      font_style = null;
      font_weight = null;
    };
    diff.minus = {
      color = "#${el.base08}";
      font_style = null;
      font_weight = null;
    };
    tag = {
      color = "#${el.base0D}";
      font_style = null;
      font_weight = null;
    };
    tag.attribute = {
      color = "#${el.base0A}";
      font_style = "italic";
      font_weight = null;
    };
    tag.delimiter = {
      color = "#${el.base0C}";
      font_style = null;
      font_weight = null;
    };

    parameter = {
      color = "#${el.base12}";
      font_style = null;
      font_weight = null;
    };

    field = {
      color = "#${el.base07}";
      font_style = null;
      font_weight = null;
    };

    namespace = {
      color = "#${el.base0A}";
      font_style = "italic";
      font_weight = null;
    };

    float = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };

    symbol = {
      color = "#${el.base17}";
      font_style = null;
      font_weight = null;
    };

    string.regex = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };

    text = {
      color = "#${el.base05}";
      font_style = null;
      font_weight = null;
    };

    emphasis.strong = {
      color = "#${el.base12}";
      font_style = null;
      font_weight = 700;
    };

    emphasis = {
      color = "#${el.base12}";
      font_style = "italic";
      font_weight = null;
    };

    embedded = {
      color = "#${el.base12}";
      font_style = null;
      font_weight = null;
    };

    text.literal = {
      color = "#${el.base0B}";
      font_style = null;
      font_weight = null;
    };

    concept = {
      color = "#${el.base16}";
      font_style = null;
      font_weight = null;
    };

    enum = {
      color = "#${el.base0C}";
      font_style = null;
      font_weight = 700;
    };

    function.decorator = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };

    type.class.definition = {
      color = "#${el.base0A}";
      font_style = null;
      font_weight = 700;
    };

    hint = {
      color = "#${el.base04}";
      font_style = "italic";
      font_weight = null;
    };

    link_text = {
      color = "#${el.base0D}";
      font_style = null;
      font_weight = null;
    };

    link_uri = {
      color = "#${el.base06}";
      font_style = "italic";
      font_weight = null;
    };

    parent = {
      color = "#${el.base09}";
      font_style = null;
      font_weight = null;
    };

    predictive = {
      color = "#${el.base03}";
      font_style = null;
      font_weight = null;
    };

    predoc = {
      color = "#${el.base08}";
      font_style = null;
      font_weight = null;
    };

    primary = {
      color = "#${el.base12}";
      font_style = null;
      font_weight = null;
    };

    tag.doctype = {
      color = "#${el.base0E}";
      font_style = null;
      font_weight = null;
    };

    string.doc = {
      color = "#${el.base0C}";
      font_style = "italic";
      font_weight = null;
    };

    title = {
      color = "#${el.base05}";
      font_style = null;
      font_weight = 800;
    };

    variant = {
      color = "#${el.base08}";
      font_style = null;
      font_weight = null;
    };
  };

}

[
  {
    context = "Editor";
    bindings = {
      "ctrl-shift-d" = "editor::DeleteLine";
      "ctrl-shift-f" = "editor::Format";
      "ctrl-shift-c" = "editor::ToggleComments";
      "ctrl-shift-w" = "editor::AddSelectionAbove";
      "ctrl-shift-s" = "editor::AddSelectionBelow";
    };
  }
  {
    context = "Pane";
    bindings = {
      "alt-w" = "editor::MoveLineUp";
      "alt-s" = "editor::MoveLineDown";
    };
  }
  # {
  #   bindings = {
  #     context = "Workspace";
  #     "ctrl-s" = "workspace::SaveAll";
  #   };
  # }
]

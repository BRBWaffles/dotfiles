[
  {
    key = "ctrl+shift+s";
    command = "editor.action.insertCursorAtEndOfEachLineSelected";
    when = "textInputFocus";
  }
  {
    key = "ctrl+shift+a";
    command = "editor.action.quickFix";
    when = "editorHasCodeActionsProvider && textInputFocus && !editorReadonly";
  }
  {
    key = "ctrl+shift+f";
    command = "editor.action.formatDocument";
    when = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor";
  }
  {
    key = "ctrl+shift+tab";
    command = "editor.action.indentationToSpaces";
    when = "textInputFocus";
  }
  {
    key = "ctrl+shift+d";
    command = "editor.action.deleteLines";
    when = "textInputFocus";
  }
]

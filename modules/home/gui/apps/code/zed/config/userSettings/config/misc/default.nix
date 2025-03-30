{
  lib,
  pkgs,
  ...
}:
{
  node = {
    path = lib.getExe pkgs.nodejs;
    npm_path = lib.getExe' pkgs.nodejs "npm";
  };

  soft_wrap = "editor_width";

  auto_update = false;
  autosave = "on_focus_change";
  load_direnv = "shell_hook";
  base_keymap = "VSCode";
  restore_on_startup = "last_session";
  show_wrap_guides = true;
}

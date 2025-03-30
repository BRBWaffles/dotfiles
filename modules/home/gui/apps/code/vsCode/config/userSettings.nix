{
  lib,
  pkgs,
  flake,
  ...
}:
let
  inherit (flake.config.aesthetics.themes)
    fonts
    ;
in
{
  "git.confirmSync" = false;
  "editor.insertSpaces" = false;
  "files.autoSave" = "afterDelay";
  "git.enableSmartCommit" = true;
  "nix.enableLanguageServer" = true;
  "nix.serverPath" = lib.getExe pkgs.nil;
  "nix.formatterPath" = lib.getExe pkgs.haskellPackages.nixfmt;
  "window.menuBarVisibility" = "toggle";
  "workbench.iconTheme" = "material-icon-theme";
  "workbench.startupEditor" = "none";
  "workbench.colorTheme" = "Catppuccin Macchiato";
  "workbench.statusBar.visible" = false;
  "editor.multiCursorLimit" = 700000;
  "editor.wordWrap" = "on";
  "editor.fontSize" = fonts.sizes.applications.size0;
  "editor.fontFamily" = "'${fonts.names.name0}', 'monospace', monospace";
  "terminal.integrated.fontSize" = fonts.sizes.applications.size0;
  "terminal.integrated.fontFamily" = "'${fonts.names.name0}', 'monospace', monospace";
  "editor.fontLigatures" = true;
  "elmLS.disableElmLSDiagnostics" = true;
  "elmLS.elmReviewDiagnostics" = "warning";
  "elmLS.elmReviewPath" =
    "/nix/store/r19y19rx5b7l4dzapbx1g64d30yisby1-elm-review-2.10.3/bin/elm-review";
  "editor.formatOnSave" = true;
  "[elm]" = {
    "editor.defaultFormatter" = "elmTooling.elm-ls-vscode";
  };
}

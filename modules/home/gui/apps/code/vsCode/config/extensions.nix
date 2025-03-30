{ pkgs, ... }:
with pkgs.vscode-extensions;
[
  catppuccin.catppuccin-vsc
  eamodio.gitlens
  elmtooling.elm-ls-vscode
  esbenp.prettier-vscode
  haskell.haskell
  james-yu.latex-workshop
  bbenoist.nix
  # jnoortheen.nix-ide
  mattn.lisp
  mkhl.direnv
  pkief.material-icon-theme
  streetsidesoftware.code-spell-checker
  tamasfe.even-better-toml
  brettm12345.nixfmt-vscode
]

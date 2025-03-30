{ pkgs, ... }:
builtins.attrValues {
  inherit (pkgs)
    nil
    nixfmt-rfc-style
    nixd
    wl-clipboard-rs
    xsel
    ;
  inherit (pkgs.elmPackages)
    elm-language-server
    ;
}

{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      inkscape-with-extensions
      ;
    inherit (pkgs.inkscape-extensions)
      # inkcut
      hexmap
      textext
      silhouette
      applytransforms
      ;
  };
}

{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs.elmPackages)
      elm
      elm-format
      elm-land
      elm-language-server
      elm-review
      elm-test
      ;
  };
}

{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      kid3
      ;
  };
}

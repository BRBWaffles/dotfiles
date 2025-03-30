{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      file-roller
      ;
  };
}

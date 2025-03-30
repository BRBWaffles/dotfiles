{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs.sweethome3d)
      application
      ;
  };
}

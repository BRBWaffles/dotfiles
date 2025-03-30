{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs.nodePackages)
      nodejs
      ;
  };
}

{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs.kdePackages)
      kdenlive
      ;
    inherit (pkgs)
      glaxnimate
      ;
  };
}

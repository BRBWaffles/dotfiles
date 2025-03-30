{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      android-tools
      ;
  };
}
# requires that users be part of the adbusers group

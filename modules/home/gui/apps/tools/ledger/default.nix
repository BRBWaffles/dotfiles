{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      ledger-live-desktop
      ;
  };
}

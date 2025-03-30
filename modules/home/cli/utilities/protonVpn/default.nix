{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      protonvpn-cli_2
      protonvpn-gui
      ;
  };
}

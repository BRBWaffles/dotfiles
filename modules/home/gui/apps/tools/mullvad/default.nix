{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      # mullvad
      mullvad-closest
      mullvad-vpn
      ;
  };
}

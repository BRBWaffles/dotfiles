{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      steam
      ;
  };

  home = {
    file = {
      "./.steam/steam/steam_dev.cfg" = {
        source = ./steam_dev.cfg;
      };
    };
  };
}

# If you wanna install Sc2, it takes Proton v8

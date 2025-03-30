let
  configPath = ./config;

  instancesFunctions = {
    jellyfinLabel = "Jellyfin";
    jellyfinName = "jellyfin";
    audiobookshelfLabel = "Audiobookshelf";
    audiobookshelfName = "audiobookshelf";
    domain0 = "cloudbert.fun";
    domain1 = "the-nutrivore.social";
    domain2 = "the-nutrivore.com";
    domain3 = "uprootnutrition.com";
    servicePath = "/mnt/media/NAS1";
    sopsPath = "/var/lib/secrets";
    sslPath = "/var/lib/acme";
    varLib = "/var/lib";
    dummy = "";
  };

  instances = builtins.listToAttrs (
    map
      (name: {
        name = builtins.substring 0 (builtins.stringLength name - 4) name;
        value = import (configPath + "/${name}") {
          inherit
            instancesFunctions
            ;
        };
      })
      (
        builtins.filter (name: builtins.match ".*\\.nix$" name != null) (
          builtins.attrNames (builtins.readDir configPath)
        )
      )
  );
in
{
  instances = instances;
}

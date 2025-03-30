{ flake, ... }:
let
  configPath = ./config;
  flakedPath = configPath + /flake;

  regularSearchEngines =
    let
      files = builtins.attrNames (builtins.readDir configPath);
    in
    builtins.foldl' (
      emptySet: searchEngine: emptySet // (import (configPath + "/${searchEngine}"))
    ) { } (builtins.filter (name: builtins.match ".*\\.nix$" name != null) files);

  flakedSearchEngines =
    let
      files = builtins.attrNames (builtins.readDir flakedPath);
    in
    builtins.foldl' (
      emptySet: searchEngine:
      emptySet
      // (import (flakedPath + "/${searchEngine}") {
        inherit
          flake
          ;
      })
    ) { } (builtins.filter (name: builtins.match ".*\\.nix$" name != null) files);

  aggregatedSearchEngines = regularSearchEngines // flakedSearchEngines;
in
{
  search = {
    force = true;
    default = "Brave";
    engines = aggregatedSearchEngines;
    order = [
      "AlternativeTo"
      "Core Radio"
      "Hackage"
      "Hoogle"
      "Jellyfin"
      "SearXNG"
      "Nix Home Manager"
      "Nix Options"
      "Nix Packages"
      "Nix Wiki"
      "PeerTube"
      "Sci-Hub"
      "Torrent Leech"
      "Urban Dictionary"
      "Wikipedia"
      "YouTube"
    ];
  };
}

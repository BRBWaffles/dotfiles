{ flake, ... }:
let
  configPath = ./config;
  flakedPath = configPath + /flake;

  filterFiles = name: builtins.match ".*\\.nix$" name != null;

  regularBookmarks =
    let
      files = builtins.attrNames (builtins.readDir configPath);
    in
    builtins.foldl' (
      emptyList: bookmarkFile: emptyList ++ (import (configPath + "/${bookmarkFile}")).bookmarks
    ) [ ] (builtins.filter filterFiles files);

  flakedBookmarks =
    let
      files = builtins.attrNames (builtins.readDir flakedPath);
    in
    builtins.foldl' (
      emptyList: bookmarkFile:
      emptyList
      ++ (import (flakedPath + "/${bookmarkFile}") {
        inherit
          flake
          ;
      }).bookmarks
    ) [ ] (builtins.filter filterFiles files);

  aggregatedBookmarks = regularBookmarks ++ flakedBookmarks;
in
{
  bookmarks = aggregatedBookmarks;
}

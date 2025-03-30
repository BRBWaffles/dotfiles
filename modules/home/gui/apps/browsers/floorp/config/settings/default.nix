let
  configPath = ./config;

  aggregatedSettings =
    let
      files = builtins.attrNames (builtins.readDir configPath);
    in
    builtins.foldl' (
      emptySet: settingsFile: emptySet // (import (configPath + "/${settingsFile}"))
    ) { } (builtins.filter (name: builtins.match ".*\\.nix$" name != null) files);
in
{
  settings = aggregatedSettings;
}

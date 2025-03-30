{ lib, ... }:
let
  configPath = ./config;

  ceresImports =
    let
      files = builtins.attrNames (builtins.readDir configPath);
    in
    map (name: configPath + "/${name}") (
      builtins.filter (name: builtins.match ".*\\.nix$" name != null) files
    );
in
{
  imports = ceresImports;
  nixpkgs.hostPlatform = lib.mkForce "x86_64-linux";
  system.stateVersion = lib.mkForce "24.05";
}

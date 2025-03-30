{ lib, ... }:
let
  configPath = ./config;

  deimosImports =
    let
      files = builtins.attrNames (builtins.readDir configPath);
    in
    map (name: configPath + "/${name}") (
      builtins.filter (name: builtins.match ".*\\.nix$" name != null) files
    );
in
{
  imports = deimosImports;
  nixpkgs.hostPlatform = lib.mkForce "x86_64-linux";
  system.stateVersion = lib.mkForce "24.05";
}

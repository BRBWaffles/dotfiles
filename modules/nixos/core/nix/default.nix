{
  config,
  lib,
  ...
}:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-unwrapped-33.0.2"
        "electron-31.7.7"
        "electron-27.3.11"
        "olm-3.2.16"
      ];
    };
  };

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
    settings = {
      substituters = [
      ];
      trusted-public-keys = [
      ];
    };
  };
  # Print package list
  environment.etc."current-system-packages".text =
    let
      packages = builtins.map (p: "${p.name}") config.environment.systemPackages;

      sortedUnique = builtins.sort builtins.lessThan (lib.unique packages);

      formatted = builtins.concatStringsSep "\n" sortedUnique;
    in
    formatted;
}

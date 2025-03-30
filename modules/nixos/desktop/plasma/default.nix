{ pkgs, ... }:
{
  services = {
    desktopManager.plasma6.enable = true;
  };
  environment.plasma6.excludePackages = builtins.attrValues {
    inherit (pkgs.kdePackages)
      plasma-browser-integration
      konsole
      kate
      spectacle
      kdeconnect-kde
      khelpcenter
      ;
  };
}

{
  lib,
  flake,
  ...
}:
let
  inherit (flake.config.machines.devices)
    mars
    ;
in
{
  networking = {
    hostName = mars.name;
    networkmanager.enable = true;
    nftables.enable = true;
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22 # SSH
        4333 # Feishin
        2234 # Soulseek
        3131 # Deskreen
        1234 # Elm-land server
        5037 # ADB Server
        44363
      ];
    };
  };
  services = {
    avahi = {
      enable = true;
      openFirewall = true;
      nssmdns4 = true;
    };
    sshd.enable = true;
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };
  };
}

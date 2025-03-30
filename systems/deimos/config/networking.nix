{
  lib,
  flake,
  ...
}:
let
  inherit (flake.config.machines.devices)
    deimos
    ;
in
{
  networking = {
    hostName = deimos.name;
    networkmanager.enable = true;
    nftables.enable = true;
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22 # SSH
        55771
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

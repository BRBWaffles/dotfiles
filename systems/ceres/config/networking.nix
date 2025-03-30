{
  lib,
  flake,
  ...
}:
let
  inherit (flake.config.machines.devices) ceres;
in
{
  networking = {
    hostName = ceres.name;
    networkmanager.enable = true;
    nftables.enable = true;
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22 # SSH
        25 # SMTP
        139 # SMTP
        587 # SMTP
        2525 # SMTP
      ];
    };
  };
  services = {
    avahi = {
      enable = true;
      openFirewall = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };
    sshd.enable = true;
    openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };
  };
}

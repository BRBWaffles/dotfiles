{
  lib,
  flake,
  ...
}:
let
  inherit (flake.config.machines.devices) venus;
in
{
  networking = {
    hostName = venus.name;
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
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

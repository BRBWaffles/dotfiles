{
  pkgs,
  flake,
  ...
}:
let
  inherit (flake.config.services.instances)
    samba
    jellyfin
    audiobookshelf
    ;
  service = samba;
in
{
  # If you ever need to start fresh, you need to add yourself to the Samba users database:
  # sudo smbpasswd -a username
  services = {
    samba = {
      package = pkgs.samba4Full;
      enable = true;
      openFirewall = true;
      settings = {
        ${jellyfin.name} = {
          path = jellyfin.paths.path0;
          writable = "true";
        };
        ${audiobookshelf.name} = {
          path = audiobookshelf.paths.path0;
          writable = "true";
        };
      };
    };
  };

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
      ];
    };
  };
}

{ flake, ... }:
let
  inherit (flake.config.machines.devices)
    synology
    phone
    tablet
    ;
  inherit (flake.config.services.instances)
    syncthing
    web
    ;
  service = syncthing;
  localhost = web.localhost.address0;
in
{
  services = {
    syncthing = {
      enable = true;
      overrideDevices = false;
      overrideFolders = false;
      openDefaultPorts = true;
      systemService = true;
      guiAddress = "${localhost}:${toString service.ports.port0}";
      settings = {
        devices = {
          ${synology.name} = {
            autoAcceptFolders = true;
            name = synology.name;
            addresses = [
              "tcp://${synology.ip.address0}:${toString service.ports.port2}"
            ];
            id = synology.sync.address0;
          };
          ${phone.name} = {
            autoAcceptFolders = true;
            name = phone.name;
            addresses = [
              "tcp://${phone.ip.address0}:${toString service.ports.port2}"
            ];
            id = phone.sync.address0;
          };
        };
      };
    };
  };

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
        service.ports.port1
        service.ports.port2
      ];
    };
  };
}

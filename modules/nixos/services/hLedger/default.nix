{
  flake,
  pkgs,
  ...
}:
let
  inherit (flake.config.machines.devices)
    ceres
    ;
  inherit (flake.config.services.instances)
    hledger
    web
    ;
  service = hledger;
  localhost = web.localhost.address0;
in
{
  services = {
    hledger-web = {
      enable = true;
      host = localhost;
      # baseUrl = "https://${host}";
      stateDir = service.paths.path0;
      port = service.ports.port0;
      journalFiles = [
        ".hledger.journal"
      ];
      allow = "edit";
    };
  };

  environment = {
    systemPackages = builtins.attrValues {
      inherit (pkgs)
        hledger
        hledger-ui
        ;
    };
  };

  users = {
    users.${service.name} = {
      isSystemUser = true;
      group = service.name;
      home = service.paths.path0;
    };
    groups.${service.name} = { };
  };

  fileSystems."/var/lib/${service.name}" = {
    device = service.paths.path0;
    fsType = "none";
    options = [
      "bind"
    ];
    depends = [
      ceres.storage0.mount
    ];
  };

  systemd.tmpfiles.rules = [
    "Z ${service.paths.path0} 0755 ${service.name} ${service.name} -"
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
      ];
    };
  };
}

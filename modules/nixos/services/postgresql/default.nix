{ flake, ... }:
let
  inherit (flake.config.machines.devices)
    ceres
    ;
  inherit (flake.config.services.instances)
    postgresql
    ;

  service = postgresql;
in
{
  services = {
    postgresqlBackup = {
      enable = true;
      location = service.paths.path0;
      databases = [
        "mastodon"
        "nextcloud"
        "peertube"
        "forgejo"
      ];
    };
    postgresql = {
      enable = true;
    };
  };
  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
      ];
    };
  };

  fileSystems."/var/lib/postgresql" = {
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
    "Z ${service.paths.path0} 700 ${service.name} ${service.name} -"
  ];

  users.users.${service.name}.extraGroups = [
    "nextcloud"
    "mastodon"
    "forgejo"
  ];

  system.activationScripts.postgresCommands = ''
    chown -R ${service.name}:${service.name} ${service.paths.path0}
  '';
}

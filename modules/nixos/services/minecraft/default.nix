{
  config,
  flake,
  ...
}:
let
  inherit (flake.config.machines.devices)
    ceres
    ;
  inherit (flake.config.services.instances)
    minecraft
    ;
  service = minecraft;
in
{
  services = {
    minecraft-server = {
      enable = true;
      eula = true;
      openFirewall = true;
      declarative = true;
      serverProperties = {
        "rcon.password" = config.sops.secrets."${service.name}-pass".path;
        allow-flight = false;
        allow-nether = true;
        difficulty = 2;
        enable-command-block = false;
        enable-rcon = true;
        enable-status = true;
        force-gamemode = true;
        gamemode = 0;
        generate-structures = true;
        hardcore = false;
        hide-online-players = false;
        level-name = "Brix on Nix";
        level-seed = "9064150133272194";
        max-players = 10;
        max-world-size = 64000000;
        motd = "A cool Minecraft server powered by NixOS";
        online-mode = true;
        pvp = true;
        server-port = service.ports.port0;
        spawn-animals = true;
        spawn-monsters = true;
        spawn-npcs = true;
        spawn-protection = 16;
        view-dtstance = 32;
        white-list = true;
      };
      whitelist = {
        Hefty_Chungus = "b75a9816-d408-4c54-b226-385b59ea1cb3";
        Hefty_Chungus_Jr = "c3bf8cac-e953-4ea4-ae5f-7acb92a51a85";
        EclipseMoon01 = "adef4af7-d8c6-4627-b492-e990ea1bb993";
        Fallaryn = "d8baa117-ab58-4b07-92a5-48fb1978eb49";
      };
    };
  };
  sops =
    let
      sopsPath = secret: {
        path = "${service.sops.path0}/${service.name}-${secret}";
        owner = service.name;
        mode = "600";
      };
    in
    {
      secrets = builtins.listToAttrs (
        map
          (secret: {
            name = "${service.name}-${secret}";
            value = sopsPath secret;
          })
          [
            "pass"
          ]
      );
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
    "Z ${service.sops.path0} 0755 ${service.name} ${service.name} -"
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
      ];
    };
  };
}

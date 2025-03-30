{
  flake,
  config,
  pkgs,
  ...
}:
let
  inherit (flake.config.machines.devices)
    mars
    ceres
    ;
  inherit (flake.config.services.instances)
    ollama
    web
    ;
  service = ollama;
  localhost = web.localhost.address0;
  hostname = config.networking.hostName;
  host = "${service.subdomain}.${web.domains.url0}";

  caddyLogic =
    if hostname == ceres.name then
      {
        caddy = {
          virtualHosts = {
            ${host} = {
              extraConfig = ''
                reverse_proxy ${localhost}:${toString service.ports.port0}

                tls ${service.ssl.cert} ${service.ssl.key}
              '';
            };
          };
        };
      }
    else
      { };

  mountLogic =
    if hostname == ceres.name then
      {
        "/var/lib/${service.name}" = {
          device = service.paths.path0;
          fsType = "none";
          options = [
            "bind"
          ];
          depends = [
            ceres.storage0.mount
          ];
        };
      }
    else
      { };
in
{
  services = {
    ollama =
      {
        enable = true;
        group = service.name;
        host = "http://${localhost}";
        user = service.name;
      }
      // (
        if hostname == mars.name then
          {
            # models = service.paths.path1;
            acceleration = "rocm";
            package = pkgs.ollama.override {
              config = {
                rocmSupport = true;
                cudaSupport = false;
              };
            };
          }
        else
          {
            port = service.ports.port1;
            acceleration = false;
            models = service.paths.path0;
          }
      );
    open-webui = {
      enable = true;
      host = localhost;
      port = service.ports.port0;
      environment = {
        ENABLE_OLLAMA_API = "True";
        ANONYMIZED_TELEMETRY = "False";
        DO_NOT_TRACK = "True";
        SCARF_NO_ANALYTICS = "True";
        OLLAMA_BASE_URL = "http://${localhost}:${toString service.ports.port1}";
        WEBUI_AUTH = "True";
      };
    };
  } // caddyLogic;

  systemd.tmpfiles.rules = [
    (
      if hostname == mars.name then
        "Z ${service.paths.path1} 0777 ${service.name} ${service.name} -"
      else
        "Z ${service.paths.path0} 0755 ${service.name} ${service.name} -"
    )
  ];

  networking = {
    firewall = {
      allowedTCPPorts = [
        # 8080
        service.ports.port0
        service.ports.port1
      ];
    };
  };
  fileSystems = mountLogic;
}

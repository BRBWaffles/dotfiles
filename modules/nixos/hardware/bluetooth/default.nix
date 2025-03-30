{
  pkgs,
  config,
  flake,
  ...
}:
let
  inherit (flake.config.machines) devices;
  hostname = config.networking.hostName;
in
{
  hardware = {
    bluetooth = {
      enable = true;
      package = pkgs.bluez;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          Disable = "Headset";
        };
      };
      disabledPlugins = [
        "sap"
      ];
    };
  };
  services.blueman.enable = if hostname == devices.deimos.name then false else true;
}

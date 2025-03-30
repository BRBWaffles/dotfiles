{
  flake,
  pkgs,
  ...
}:
let
  inherit (flake.config.machines.devices)
    printer0
    printer1
    ;
  genericPPD = "drv:///sample.drv/generic.ppd";
  pageSize = "Letter";
in
{
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        brlaser
        cups-brother-hll2375dw
      ];
    };
  };

  hardware.printers = {
    ensurePrinters = [
      {
        name = printer0.label;
        location = "Downstairs";
        deviceUri = "https://${printer0.ip.address0}";
        model = genericPPD;
        ppdOptions = {
          PageSize = pageSize;
        };
      }
      {
        name = printer1.label;
        location = "Upstairs";
        deviceUri = "https://${printer1.ip.address0}";
        model = genericPPD;
        ppdOptions = {
          PageSize = pageSize;
        };
      }
    ];
    ensureDefaultPrinter = printer1.label;
  };

  networking = {
    firewall = {
      allowedTCPPorts = [
        631
      ];
    };
  };
}

{
  config,
  lib,
  pkgs,
  ...
}:
{
  hardware = {
    firmware = builtins.attrValues {
      inherit (pkgs)
        rtl8761b-firmware
        ;
    };
    enableAllFirmware = true;
    ledger.enable = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}

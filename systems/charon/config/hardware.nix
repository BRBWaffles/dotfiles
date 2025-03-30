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
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}

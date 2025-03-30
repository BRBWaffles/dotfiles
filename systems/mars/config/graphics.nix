{ pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = builtins.attrValues {
        inherit (pkgs)
          amdvlk
          ;
        inherit (pkgs.rocmPackages.clr)
          icd
          ;
      };
      extraPackages32 = builtins.attrValues {
        inherit (pkgs.driversi686Linux)
          amdvlk
          ;
      };
    };
  };
  boot.initrd.kernelModules = [
    "amdgpu"
  ];
}

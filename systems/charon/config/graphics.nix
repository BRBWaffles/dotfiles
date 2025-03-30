{
  hardware = {
    graphics = {
      enable = true;
      extraPackages = [ ];
      extraPackages32 = [ ];
    };
  };
  boot.initrd.kernelModules = [
  ];
  services.xserver.videoDrivers = [ "modesetting" ];
}

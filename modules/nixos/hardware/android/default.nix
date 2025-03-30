{ pkgs, ... }:
{
  programs = {
    adb.enable = true;
    droidcam.enable = true;
  };
  services.udev = {
    enable = true;
    packages = builtins.attrValues {
      inherit (pkgs)
        android-udev-rules
        ;
    };
    extraRules = ''
      # Amazon Fire Tablet
      SUBSYSTEM=="usb", ATTR{idVendor}=="1949", ATTR{idProduct}=="0632", MODE="0666", GROUP="adbusers"
      SUBSYSTEM=="usb", ATTR{idVendor}=="1949", ATTR{idProduct}=="0632", SYMLINK+="android_adb"
      SUBSYSTEM=="usb", ATTR{idVendor}=="1949", ATTR{idProduct}=="0632", SYMLINK+="android_fastboot"

      # General Android rules
      SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", MODE="0666"
      SUBSYSTEM=="usb", ATTR{idVendor}=="1949", MODE="0666", GROUP="adbusers"
    '';
  };
}

{ pkgs, ... }:
{
  hardware.keyboard.zsa.enable = true;

  environment = {
    enableAllTerminfo = true;
    systemPackages = builtins.attrValues {
      inherit (pkgs)
        zsa-udev-rules
        keymapp
        kontroll
        ;
    };
  };
}

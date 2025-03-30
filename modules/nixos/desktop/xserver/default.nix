{
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        # variant = "colemak_dh"
      };
    };
    libinput = {
      enable = true;
      touchpad = {
        scrollMethod = "twofinger";
        naturalScrolling = true;
        middleEmulation = true;
        accelSpeed = "5";
        accelProfile = "adaptive";
        disableWhileTyping = true;
      };
      mouse.accelProfile = "flat";
    };
  };
  console.useXkbConfig = true;
}

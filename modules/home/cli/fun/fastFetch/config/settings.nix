{
  logo = {
    source = "nixos_large";
    padding = {
      right = 2;
      top = 3;
    };
  };
  display = {
    size = {
      binaryPrefix = "si";
    };
    color = "magenta";
    separator = " → ";
  };
  modules = [
    {
      type = "separator";
      string = "SYSTEM:     ";
    }
    {
      type = "os";
      key = "NixOS Version";
    }
    {
      type = "kernel";
      key = "Kernel Version";
    }
    "shell"
    "terminal"
    "packages"
    "locale"
    {
      type = "wm";
      key = "Window Manager";
    }
    {
      type = "separator";
      string = "HARDWARE:   ";
    }
    {
      type = "board";
      key = "Motherboard";
    }
    {
      type = "cpu";
      key = "Processor";
    }
    {
      type = "gpu";
      key = "Graphics";
    }
    "memory"
    "disk"
    "display"
    "gamepad"
    {
      type = "sound";
      key = "Audio Interface";
    }
    {
      type = "separator";
      string = "INTERFACE:  ";
    }
    "theme"
    "cursor"
    "icons"
    "font"
    "editor"
    "player"
    {
      type = "media";
      key = "Song";
    }
  ];
}

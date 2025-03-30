{
  services.wpaperd = {
    enable = true;
    settings = {
      "default" = {
        path = "~/.config/wallpaper";
        apply-shadow = true;
        duration = "1m";
        sorting = "random";
      };
    };
  };
}

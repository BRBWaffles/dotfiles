{
  services.gammastep = {
    enable = true;
    tray = true;
    provider = "geoclue2";
    temperature = {
      day = 6500;
      night = 3500;
    };
    dawnTime = "8:00-8:30";
    duskTime = "20:30-21:00";
  };
}

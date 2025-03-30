{
  programs.nushell = {
    enable = true;
    configFile.text = ''
      sleep 7ms
      $env.config = {show_banner: false}
    '';
    shellAliases = {
      y = "yy";
      lg = "lazygit";
      yt = "yt-dlp --embed-chapters";
      ze = "zellij";
    };
  };
}

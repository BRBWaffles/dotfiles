{ pkgs, ... }:
{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraPackages = builtins.attrValues {
        inherit (pkgs)
          curl
          ;
      };
      gamescopeSession.enable = true;
    };
    java.enable = true;
  };
  hardware.steam-hardware.enable = true;
  programs.gamescope = {
    enable = true;
  };
}

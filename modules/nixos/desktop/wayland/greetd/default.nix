{
  config,
  flake,
  lib,
  ...
}:
let
  inherit (flake.config.people)
    user0
    user1
    user2
    ;
  inherit (flake.config.machines) devices;
  venus = devices.venus.name;
  charon = devices.charon.name;

  host = config.networking.hostName;
in
{
  services = {
    greetd = {
      enable = true;
      vt = 7;
      settings =
        let
          default_session = {
            command = "${lib.meta.getExe config.programs.hyprland.package}";
            user =
              if host == charon then
                user1
              else if host == venus then
                user2
              else
                user0;
          };
        in
        {
          inherit
            default_session
            ;
          initial_session = default_session;
        };
    };
  };
}

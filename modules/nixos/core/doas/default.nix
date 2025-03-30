{
  flake,
  config,
  ...
}:
let
  inherit (flake.config.people)
    user0
    user1
    user2
    user3
    ;
  inherit (flake.config.machines)
    devices
    ;
  hostname = config.networking.hostName;
  mars = devices.mars.name;
  ceres = devices.ceres.name;
  venus = devices.venus.name;
  charon = devices.charon.name;
  deimos = devices.deimos.name;

  userLogic =
    if
      builtins.elem hostname [
        mars
        deimos
        ceres
      ]
    then
      [
        user0
        user1
        user3
      ]
    else if hostname == charon then
      [ user1 ]
    else if hostname == venus then
      [ user2 ]
    else
      [ ];
in
{
  security = {
    doas = {
      enable = true;
      extraRules = [
        {
          keepEnv = true;
          noPass = true;
          users = userLogic;
        }
      ];
    };
    # sudo.enable = false;
  };
}

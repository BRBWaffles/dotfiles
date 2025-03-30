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
  deimos = devices.deimos.name;
  ceres = devices.ceres.name;
  venus = devices.venus.name;
  charon = devices.charon.name;

  # Helper function to get SSH keys for a specific user
  getUserKeys = user: flake.config.people.users.${user}.sshKeys;
in
{
  users.users =
    if hostname == charon then
      { }
    else if hostname == mars then
      {
        ${user0} = {
          openssh.authorizedKeys.keys = getUserKeys user0;
        };
        ${user3} = {
          openssh.authorizedKeys.keys = getUserKeys user3;
        };
      }
    else if
      builtins.elem hostname [
        deimos
        ceres
      ]
    then
      {
        ${user0} = {
          openssh.authorizedKeys.keys = getUserKeys user0;
        };
      }
    else if hostname == venus then
      {
        ${user2} = {
          openssh.authorizedKeys.keys = getUserKeys user2;
        };
      }
    else
      { };
}

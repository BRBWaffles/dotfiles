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
      user0
    else if hostname == charon then
      user1
    else if hostname == venus then
      user2
    else
      "";
in
{
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    validateSopsFiles = false;
    age = {
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = false;
    };
    secrets =
      if hostname == charon then
        { }
      else
        {
          "ssh/private" = {
            path = "/home/${userLogic}/.ssh/id_ed25519";
            owner = userLogic;
          };
          "ssh/public" = {
            path = "/home/${userLogic}/.ssh/id_ed25519.pub";
            owner = userLogic;
          };
          "ssh/hosts" = {
            path = "/home/${userLogic}/.ssh/known_hosts";
            owner = userLogic;
          };
          # "claude-api-key" = {
          #   path = "/home/${user0}/.config/zed/claude-api-key";
          #   owner = user0;
          # };
        };
  };
}

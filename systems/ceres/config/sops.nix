{ flake, ... }:
let
  inherit (flake.config.people)
    user0
    ;
in
{
  sops = {
    secrets = {
      "discord-token" = {
        path = "/home/${user0}/projects/zookeeper/.env";
        owner = user0;
      };
    };
  };
}

{ flake, ... }:
let
  inherit (flake.config.people)
    user0
    ;
  inherit (flake.config.people.users.${user0})
    paths
    ;
in
{
  sops = {
    secrets = {
      "network/synology" = {
        path = "/var/lib/secrets/synology";
        owner = "root";
        mode = "600";
      };
      "network/server" = {
        path = "/var/lib/secrets/server";
        owner = "root";
        mode = "600";
      };
      "discord-token" = {
        path = "${paths.path0}/zookeeper/.env";
        owner = user0;
      };
    };
  };
}

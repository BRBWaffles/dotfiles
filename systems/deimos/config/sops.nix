{ flake, ... }:
let
  inherit (flake.config.people)
    user1
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
      "network/${user1}" = {
        path = "/var/lib/secrets/${user1}";
        owner = "root";
        mode = "600";
      };
    };
  };
}

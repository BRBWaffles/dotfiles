let
  configPath = ./config;

  user0 = "nick";
  user1 = "garnet";
  user2 = "fallaryn";
  user3 = "streaming";
in
{
  inherit
    user0
    user1
    user2
    user3
    ;
  users = {
    "${user0}" = import (configPath + /user0.nix) { inherit user0; };
    "${user1}" = import (configPath + /user1.nix) { inherit user1; };
    "${user2}" = import (configPath + /user2.nix) { inherit user2; };
    "${user3}" = import (configPath + /user3.nix) { inherit user3; };
  };
}

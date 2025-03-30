{ user1 }:
let
  inherit
    user1
    ;
in
{
  name = "Garnet";
  email = {
    address0 = "ninaeffler@gmail.com";
  };
  paths = {
    path0 = "/home/${user1}/Files/Projects"; # Git path
  };
}

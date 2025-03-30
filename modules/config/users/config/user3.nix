{ user3 }:
let
  inherit
    user3
    ;
in
{
  name = "Streaming";
  aliases = {
  };
  email = {
    address0 = "nick@upRootNutrition.com";
  };
  paths = {
    path0 = "/home/${user3}/Files/Projects"; # Git path
  };
  sshKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBF9TmImDoYDpsW5VMFbOcuK3aH4TWRtx/xGxT3yUtEN nick@desktop"
  ];
}

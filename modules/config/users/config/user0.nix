{ user0 }:
let
  inherit
    user0
    ;
in
{
  name = "Nick";
  aliases = {
    name0 = "BRBWaffles";
    name1 = "brbwaffles";
    name2 = "Nutrivore";
    name3 = "nutrivore";
    name4 = "upRootNutrition";
  };
  email = {
    address0 = "nickjhiebert@proton.me";
    address1 = "thenutrivore@proton.me";
    address2 = "nick@uprootnutrition.com";
  };
  paths = {
    path0 = "/home/${user0}/Files/Projects"; # Git path
  };
  sshKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBF9TmImDoYDpsW5VMFbOcuK3aH4TWRtx/xGxT3yUtEN nick@desktop"
  ];
}

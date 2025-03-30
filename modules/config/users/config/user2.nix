{ user2 }:
let
  inherit
    user2
    ;
in
{
  name = "Stacie";
  email = {
    address0 = "staciesimonson@gmail.com";
  };
  paths = {
    path0 = "/home/${user2}"; # Git path
  };
  sshKeys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILQQDw0NigCC76G/GlHWIMunckaBmfgqbfJXFGWB+8fe stacie@desktop"
  ];

}

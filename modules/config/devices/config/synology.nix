{ devicesFunctions }:
let
  inherit (devicesFunctions)
    sambaPermissions
    userIdForUser0
    userIdForUser1
    userIdForUser3
    synologyIP
    ;

  user0 = "nick";
  user1 = "garnet";
  user3 = "streaming";
  user0Name = "Nick";
  user1Name = "Garnet";
  user3Name = "Streaming";
  synologyName = "synology";
in
{
  label = "Synology";
  sync = {
    address0 = "MWRGX2V-F5XKE5E-REP6ECT-OOPFBMF-22NHSMW-YFBU6MB-PLFUN63-R3MW2QX"; # User0
    address1 = ""; # User2
  };
  name = synologyName;
  ip = {
    address0 = synologyIP;
  };
  # Nick Home Folder
  folder0 = {
    mount = "/mnt/media/${synologyName}/${user0}";
    device = "//${synologyIP}/homes/${user0Name}";
    options = sambaPermissions ++ userIdForUser0;
  };
  # Garnet Home Folder
  folder1 = {
    mount = "/mnt/media/${synologyName}/${user1}";
    device = "//${synologyIP}/homes/${user1Name}";
    options = sambaPermissions ++ userIdForUser1;
  };
  # Minecraft Worlds
  folder2 = {
    mount = "/home/${user1}/.local/share/PrismLauncher/instances/1.21/.minecraft/saves";
    device = "//${synologyIP}/homes/${user1Name}/Minecraft";
    options = sambaPermissions ++ userIdForUser1;
  };
  # Streaming Folder
  folder3 = {
    mount = "/mnt/media/${synologyName}/${user3}";
    device = "//${synologyIP}/homes/${user0Name}";
    options = sambaPermissions ++ userIdForUser3;
  };
}

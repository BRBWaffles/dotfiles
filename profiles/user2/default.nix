{
  config,
  flake,
  pkgs,
  ...
}:
let
  inherit (flake) self;
  inherit (flake.config.people) user2;
  inherit (flake.config.machines) devices;
  inherit (flake.config.people.users.${user2}) name paths;
  hostname = config.networking.hostName;
in

{
  users = {
    users.${user2} = {
      description = name;
      name = user2;
      isNormalUser = true;
      shell = pkgs.nushell;
      extraGroups = [
        "adbusers"
        "disk"
        "libvirtd"
        "minecraft"
        "netdev"
        "networkmanager"
        "ollama"
        "syncthing"
        "vboxusers"
        "wheel"
      ];
    };
  };
  home-manager.users = {
    ${user2} = {
      home = {
        username = user2;
        homeDirectory = "/home/${user2}";
        file = {
          "./justfile" = {
            source = ./files/justfile;
          };
        };
        sessionVariables = {
          WLR_NO_HARDWARE_CURSORS = "1";
          WLR_DRM_NO_ATOMIC = "1";
          VIDEO_PLAYER = "vlc";
          EDITOR = "vscode";
          NIXPKGS_ALLOW_INSECURE = "1";
        };
      };

      imports = [
        {
          home.stateVersion = config.system.stateVersion;
        }
        {
          imports = [
            self.homeModules."${devices.${hostname}.name}-${user2}"
          ];
        }
      ];
    };
  };
  systemd.tmpfiles =
    let
      directoriesAddedToHome = [
        "Projects"
      ];

      directoriesRemovedFromHome = [
        "Music"
        "Public"
        "Templates"
      ];
    in
    {
      rules =
        [
          "d ${paths.path0}/Projects 0755 ${user2} users -"
          "Z ${paths.path0}/.ssh 700 ${user2} users -"
        ]
        ++ (map (path: "d /home/${user2}/${path} 0755 ${user2} users -") directoriesAddedToHome)
        ++ (map (path: "R /home/${user2}/${path} 0755 ${user2} users - -") directoriesRemovedFromHome);
    };

}

{ lib, ... }:
let
  stringType = lib.mkOption {
    type = lib.types.str;
  };
  intType = lib.mkOption {
    type = lib.types.int;
  };
  listType = lib.mkOption {
    type = lib.types.listOf lib.types.str;
  };
  attrList = lib.mkOption {
    type = lib.types.attrsOf lib.types.str;
  };

  numOptions = 20;

  genOptions =
    config: prefix:
    builtins.listToAttrs (
      map (i: {
        name = "${prefix}${toString i}";
        value = config;
      }) (builtins.genList (i: i) numOptions)
    );

  mkOptionsFromDir =
    path:
    builtins.listToAttrs (
      map
        (name: {
          name = builtins.substring 0 (builtins.stringLength name - 4) name;
          value = stringType;
        })
        (
          builtins.filter (name: builtins.match ".*\\.nix$" name != null) (
            builtins.attrNames (builtins.readDir path)
          )
        )
    );

  userSubmodule = lib.types.submodule {
    options = {
      name = stringType;
      label = stringType;
      sshKeys = listType;
      group = stringType;
      aliases = genOptions stringType "name";
      email = genOptions stringType "address";
      paths = genOptions stringType "path";
    };
  };

  instanceSubmodule = lib.types.submodule {
    options = {
      subdomain = stringType;
      label = stringType;
      name = stringType;
      hostname = stringType;
      domains = genOptions stringType "url";
      dns = genOptions stringType "provider";
      localhost = genOptions stringType "address";
      email = genOptions stringType "address";
      sops = genOptions stringType "path";
      paths = genOptions stringType "path";
      ports = genOptions intType "port";
      ssl = {
        cert = stringType;
        key = stringType;
      };
    };
  };

  deviceSubmodule = lib.types.submodule {
    options =
      let
        mountConfig = {
          mount = stringType;
          device = stringType;
          options = listType;
        };
      in
      {
        boot = mountConfig;
        ip = genOptions stringType "address";
        label = stringType;
        name = stringType;
        sync = genOptions stringType "address";
      }
      // genOptions mountConfig "folder"
      // genOptions mountConfig "samba"
      // genOptions mountConfig "storage";
  };

  themesSubmodule = lib.types.submodule {
    options = {
      currentTheme = genOptions stringType "theme";
      fonts = {
        names = genOptions stringType "name";
        sizes = {
          applications = genOptions intType "size";
          desktop = genOptions intType "size";
          popups = genOptions intType "size";
          terminal = genOptions intType "size";
        };
      };
      cursor = {
        name = stringType;
        size = intType;
      };
      palettes = lib.mkOption {
        type = lib.types.attrsOf (
          lib.types.submodule {
            options = {
              colours = attrList;
              font = stringType;
            };
          }
        );
      };

    };
  };
in
{
  options = {
    services = lib.mkOption {
      type = lib.types.submodule {
        options = mkOptionsFromDir ./instances/config // {
          instances = lib.mkOption {
            type = lib.types.attrsOf instanceSubmodule;
          };
        };
      };
    };
    machines = lib.mkOption {
      type = lib.types.submodule {
        options =
          let
            devicesPath = ./devices/config;
            printerPath = devicesPath + /printers;
          in
          mkOptionsFromDir devicesPath
          // mkOptionsFromDir printerPath
          // {
            devices = lib.mkOption {
              type = lib.types.attrsOf deviceSubmodule;
            };
          };
      };
    };
    people = lib.mkOption {
      type = lib.types.submodule {
        options = mkOptionsFromDir ./users/config // {
          users = lib.mkOption {
            type = lib.types.attrsOf userSubmodule;
          };
        };
      };
    };
    aesthetics = lib.mkOption {
      type = lib.types.submodule {
        options = mkOptionsFromDir ./themes // {
          themes = lib.mkOption {
            type = themesSubmodule;
          };
        };
      };
    };
  };

  config = {
    people = import ./users;
    services = import ./instances;
    machines = import ./devices;
    aesthetics = import ./themes;
  };
}

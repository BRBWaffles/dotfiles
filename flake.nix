{
  description = "Nick's Big Fat Flakey Sausage";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    systems.url = "github:nix-systems/x86_64-linux";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ngipkgs.url = "github:ngi-nix/ngipkgs";
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks-nix = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi.url = "github:sxyazi/yazi";
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-portal = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    waybar = {
      url = "github:Alexays/Waybar";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zed-editor = {
      url = "github:zed-industries/zed";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.pre-commit-hooks-nix.flakeModule
        ./lib
        ./modules
        ./parts
      ];

      flake =
        { config, ... }:
        {
          nixosConfigurations = {
            mars = inputs.self.lib.mkLinuxSystem [
              ./systems/mars
              ./profiles/user0
              ./profiles/user1
              ./profiles/user3
              config.nixosModules.mars
              config.nixosModules.core
              config.nixosModules.mantle
              config.nixosModules.crust
              inputs.nixos-cosmic.nixosModules.default
              inputs.home-manager.nixosModules.home-manager
              inputs.lix-module.nixosModules.default
              inputs.nur.modules.nixos.default
              inputs.sops-nix.nixosModules.sops
            ];
            venus = inputs.self.lib.mkLinuxSystem [
              ./systems/venus
              ./profiles/user2
              config.nixosModules.venus
              config.nixosModules.core
              config.nixosModules.mantle
              config.nixosModules.crust
              inputs.home-manager.nixosModules.home-manager
              inputs.lix-module.nixosModules.default
              inputs.sops-nix.nixosModules.sops
            ];
            deimos = inputs.self.lib.mkLinuxSystem [
              ./systems/deimos
              ./profiles/user0
              ./profiles/user1
              ./profiles/user2
              config.nixosModules.deimos
              config.nixosModules.core
              config.nixosModules.mantle
              config.nixosModules.crust
              inputs.home-manager.nixosModules.home-manager
              inputs.lix-module.nixosModules.default
              inputs.nur.modules.nixos.default
              inputs.sops-nix.nixosModules.sops
            ];
            charon = inputs.self.lib.mkLinuxSystem [
              ./systems/charon
              ./profiles/user1
              config.nixosModules.charon
              config.nixosModules.core
              config.nixosModules.crust
              inputs.home-manager.nixosModules.home-manager
              inputs.lix-module.nixosModules.default
            ];
            ceres = inputs.self.lib.mkLinuxSystem [
              ./systems/ceres
              ./profiles/user0
              config.nixosModules.ceres
              config.nixosModules.core
              config.nixosModules.mantle
              inputs.home-manager.nixosModules.home-manager
              inputs.lix-module.nixosModules.default
              inputs.ngipkgs.nixosModules."services.peertube"
              inputs.ngipkgs.nixosModules.default
              inputs.sops-nix.nixosModules.sops
            ];
          };
          templates = {
            elm = {
              path = ./templates/elm;
              description = "Elm Environment";
            };
            haskell = {
              path = ./templates/haskell;
              description = "Haskell Environment";
            };
            typst = {
              path = ./templates/typst;
              description = "Typst Environment";
            };
          };
        };

      systems = import inputs.systems;
    };
}

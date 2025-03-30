{ flake, ... }:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup5";
    extraSpecialArgs = {
      inherit
        flake
        ;
    };
  };
}

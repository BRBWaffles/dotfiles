{
  pkgs,
  pkgs-stable,
  ...
}:
{
  devShells = {
    default = pkgs.mkShell {
      packages = builtins.attrValues {
        inherit (pkgs)
          age
          just
          nil
          nixd
          sops
          ssh-to-age
          nixfmt-rfc-style
          ;
        inherit (pkgs-stable.elmPackages)
          elm
          elm-format
          elm-land
          elm-language-server
          elm-review
          elm-test
          ;
        inherit (pkgs.haskellPackages)
          nixfmt
          ;
      };
    };
  };
}

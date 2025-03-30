{ pkgs, config, ... }:
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
      };
      shellHook = "${config.pre-commit.installationScript}";
    };
  };
}

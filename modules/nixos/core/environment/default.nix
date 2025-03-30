{
  pkgs,
  config,
  ...
}:
{
  environment = {
    enableAllTerminfo = true;
    systemPackages = builtins.attrValues {
      inherit (pkgs)
        git
        grim
        pijul
        sshfs
        tomb
        just
        virt-manager
        ;
    };
    variables = {
      VIDEO_PLAYER = "mpv";
      EDITOR = "hx";
      TERM = "ghostty";
      NIXPKGS_ALLOW_INSECURE = "1";
      NIXPKGS_ALLOW_UNFREE = "1";
      GTK_THEME = "catppuccin-macchiato-mauve-compact";
      # ANTHROPIC_API_KEY = config.sops.secrets.claude-api-key.path;
    };
  };
}

{ pkgs, ... }:
{
  extensions.packages = builtins.attrValues {
    inherit (pkgs.nur.repos.rycee.firefox-addons)
      bitwarden
      enhancer-for-youtube
      sponsorblock
      ublock-origin
      unpaywall
      vimium
      side-view
      ;
  };
}

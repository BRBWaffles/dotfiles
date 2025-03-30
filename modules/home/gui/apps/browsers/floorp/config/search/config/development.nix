{
  "DNS Checker" = {
    definedAliases = [
      "@dn"
    ];
    icon = ./icons/dn.png;
    urls = [
      { template = "https://dnschecker.org/#A/{searchTerms}"; }
    ];
  };
  "Hackage" = {
    definedAliases = [
      "@ha"
    ];
    icon = ./icons/ha.png;
    urls = [
      { template = "https://hackage.haskell.org/packages/search?terms={searchTerms}"; }
    ];
  };
  "Hoogle" = {
    definedAliases = [
      "@ho"
    ];
    icon = ./icons/ho.png;
    urls = [
      { template = "https://www.stackage.org/lts-22.33/hoogle?q={searchTerms}"; }
    ];
  };
  "Nix Home Manager" = {
    definedAliases = [
      "@nh"
    ];
    icon = ./icons/nx.png;
    urls = [
      { template = "https://searchix.alanpearce.eu/options/home-manager/search?query={searchTerms}"; }
    ];
  };
  "Nix Options" = {
    definedAliases = [
      "@no"
    ];
    icon = ./icons/nx.png;
    urls = [
      {
        template = "https://search.nixos.org/options?channel=unstable&size=50&sort=relevance&type=packages&query={searchTerms}";
      }
    ];
  };
  "Nix Packages" = {
    definedAliases = [
      "@np"
    ];
    icon = ./icons/nx.png;
    urls = [
      {
        template = "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query={searchTerms}";
      }
    ];
  };
  "Nix Wiki" = {
    definedAliases = [
      "@nw"
    ];
    icon = ./icons/nx.png;
    urls = [
      { template = "https://nixos.wiki/index.php?search={searchTerms}"; }
    ];
  };
}

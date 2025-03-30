{ flake, ... }:
let
  inherit (flake.config.services)
    instances
    ;
in
{
  "${instances.jellyfin.label}" = {
    definedAliases = [
      "@jf"
    ];
    icon = ./icons/jf.png;
    urls = [
      {
        template = "https://${instances.jellyfin.subdomain}.${instances.web.domains.url0}/web/#/search.html?query={searchTerms}";
      }
    ];
  };
  "${instances.peertube.label}" = {
    definedAliases = [
      "@pt"
    ];
    icon = ./icons/pt.png;
    urls = [
      {
        template = "https://${instances.peertube.subdomain}.${instances.web.domains.url1}/search?search={searchTerms}";
      }
    ];
  };
  "${instances.searx.label}" = {
    definedAliases = [
      "@sx"
    ];
    icon = ./icons/sx.png;
    urls = [
      {
        template = "https://${instances.searx.subdomain}.${instances.web.domains.url0}/search?q={searchTerms}";
      }
    ];
  };
}

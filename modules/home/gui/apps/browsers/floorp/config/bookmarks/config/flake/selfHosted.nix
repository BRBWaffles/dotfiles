{ flake, ... }:
let
  inherit (flake.config.people)
    user0
    ;
  inherit (flake.config.people.users.${user0})
    aliases
    ;
  inherit (flake.config.machines.devices)
    synology
    ceres
    ;
  inherit (flake.config.services)
    instances
    ;

  jellyfinTags = [
    "jelly"
    "video"
    "streaming"
    "movies"
    "shows"
    "music"
  ];
  ollamaTags = [
    instances.ollama.name
    "chat"
    "ai"
  ];
  owncastTags = [
    instances.owncast.name
    "own"
    "cast"
    "stream"
  ];
  syncthingTags = [
    instances.syncthing.name
    "sync"
    "thing"
    instances.synology.name
  ];
in
{
  name = "Self Hosted";
  toolbar = false;
  bookmarks = [
    {
      name = "Elm-Land Server";
      url = "http://localhost:1234";
      tags = [
        "elm-land"
        "elm"
        "land"
      ];
      keyword = "Website";
    }
    {
      name = instances.forgejo.label;
      url = "https://${instances.forgejo.subdomain}.${instances.web.domains.url3}";
      tags = [
        instances.forgejo.name
        "forge"
        "git"
      ];
      keyword = instances.forgejo.label;
    }
    # {
    #   name = instances.hledger.label;
    #   url = "http://localhost.${builtins.toString instances.hledger.ports.port0}";
    #   tags = [
    #     instances.hledger.name
    #     "hledger"
    #     "finances"
    #   ];
    #   keyword = instances.hledger.label;
    # }
    {
      name = "${instances.jellyfin.label} (Internet)";
      url = "https://${instances.jellyfin.name}.${instances.web.domains.url0}";
      tags = jellyfinTags;
      keyword = instances.jellyfin.label;
    }
    {
      name = "${instances.jellyfin.label} (Local)";
      url = "http://${ceres.ip.address0}:${toString instances.jellyfin.ports.port1}";
      tags = jellyfinTags;
      keyword = instances.jellyfin.label;
    }
    {
      name = instances.mastodon.label;
      url = "https://${instances.mastodon.subdomain}.${instances.web.domains.url3}";
      tags = [
        instances.mastodon.name
        "mast"
        "md"
      ];
      keyword = instances.mastodon.label;
    }
    {
      name = "Namecheap";
      url = "https://www.namecheap.com";
      tags = [
        "namecheap"
        "name"
        "cheap"
        "dns"
      ];
      keyword = "Name";
    }
    {
      name = instances.nextcloud.label;
      url = "https://${instances.nextcloud.subdomain}.${instances.web.domains.url1}";
      tags = [
        instances.nextcloud.name
        "next"
        "cloud"
        "calendar"
      ];
      keyword = instances.nextcloud.label;
    }
    {
      name = aliases.name2;
      url = instances.web.domains.url2;
      tags = [
        aliases.name3
        "blog"
      ];
      keyword = aliases.name2;
    }
    {
      name = "${instances.ollama.label} (Server)";
      url = "https://${instances.ollama.subdomain}.${instances.web.domains.url0}";
      tags = ollamaTags;
      keyword = instances.ollama.label;
    }
    {
      name = "${instances.ollama.label} (Desktop)";
      url = "http://localhost:${toString instances.ollama.ports.port0}";
      tags = ollamaTags;
      keyword = instances.ollama.label;
    }
    # {
    #   name = "${instances.owncast.label} (Admin)";
    #   url = "http://${ceres.ip.address0}:${toString instances.owncast.ports.port0}/admin";
    #   tags = owncastTags;
    #   keyword = instances.owncast.label;
    # }
    # {
    #   name = "${instances.owncast.label} (Server)";
    #   url = "http://${instances.owncast.subdomain}.${instances.web.domains.url1}";
    #   tags = owncastTags;
    #   keyword = instances.owncast.label;
    # }
    # {
    #   name = instances.peertube.label;
    #   url = "https://${instances.peertube.subdomain}.${instances.web.domains.url3}";
    #   tags = [
    #     instances.peertube.name
    #     "peer"
    #     "tube"
    #     "uprootnutrition"
    #   ];
    #   keyword = instances.peertube.label;
    # }
    {
      name = "Router";
      url = "http://${instances.web.localhost.address2}";
      tags = [
        "router"
        "asus"
      ];
      keyword = "Router";
    }
    {
      name = "${instances.searx.label} (Internet)";
      url = "https://${instances.searx.subdomain}.${instances.web.domains.url0}";
      tags = [
        "search"
        "sear"
        "searx"
      ];
      keyword = instances.searx.label;
    }
    {
      name = "${instances.syncthing.label} (${instances.synology.label})";
      url = "http://${synology.ip.address0}:${toString instances.syncthing.ports.port0}";
      tags = [
        "synology"
      ] ++ syncthingTags;
      keyword = instances.syncthing.label;
    }
    {
      name = "${instances.syncthing.label} (Desktop)";
      url = "http://localhost:${toString instances.syncthing.ports.port0}";
      tags = [
        "desktop"
      ] ++ syncthingTags;
      keyword = instances.syncthing.label;
    }
    {
      name = instances.synology.label;
      url = "https://${synology.ip.address0}:${toString instances.synology.ports.port0}";
      tags = [
        instances.synology.name
        "dsm"
        "cloud"
      ];
      keyword = instances.synology.label;
    }
    {
      name = instances.vaultwarden.label;
      url = "https://${instances.vaultwarden.subdomain}.${instances.web.domains.url0}";
      tags = [
        instances.vaultwarden.name
        "bitwarden"
        "vault"
        "bit"
        "warden"
      ];
      keyword = instances.vaultwarden.label;
    }
  ];
}

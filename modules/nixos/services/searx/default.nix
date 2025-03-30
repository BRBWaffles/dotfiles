{
  flake,
  lib,
  config,
  ...
}:
let
  inherit (flake.config.machines.devices) ceres;
  inherit (flake.config.services.instances) searx web;
  service = searx;
  hostname = config.networking.hostName;
  localhost = web.localhost.address0;
  host = "${service.subdomain}.${web.domains.url0}";
in
{
  services =
    {
      searx = {
        enable = true;
        redisCreateLocally = true;
        uwsgiConfig = {
          socket = "/run/searx/searx.sock";
          http = ":${builtins.toString service.ports.port0}";
          chmod-socket = "660";
        };
        settings = {
          general = {
            debug = false;
            instance_name = "SearXNG Instance";
            donation_url = false;
            contact_url = false;
            privacypolicy_url = false;
            enable_metrics = false;
          };
          ui = {
            static_use_hash = true;
            default_locale = "en";
            query_in_title = true;
            infinite_scroll = true;
            center_alignment = true;
            default_theme = "simple";
            theme_args.simple_style = "auto";
            search_on_category_select = true;
            hotkeys = "vim";
          };
          search = {
            safe_search = 0;
            autocomplete_min = 2;
            autocomplete = "duckduckgo";
            ban_time_on_fail = 5;
            max_ban_time_on_fail = 120;
          };
          server =
            {
              port = service.ports.port0;
              bind_address = localhost;
              secret_key = config.sops.secrets.searx-key.path;
              limiter = false;
              public_instance = false;
              image_proxy = true;
              method = "GET";
            }
            // (
              if hostname == ceres.name then
                {
                  base_url = "https://${host}";
                }
              else
                { }
            );
          engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {
            "duckduckgo".disabled = false;
            "brave".disabled = false;
            "bing".disabled = false;
            "mojeek".disabled = true;
            "mwmbl".disabled = false;
            "mwmbl".weight = 0.4;
            "qwant".disabled = true;
            "crowdview".disabled = false;
            "crowdview".weight = 0.5;
            "curlie".disabled = true;
            "ddg definitions".disabled = false;
            "ddg definitions".weight = 2;
            "wikibooks".disabled = false;
            "wikidata".disabled = false;
            "wikiquote".disabled = true;
            "wikisource".disabled = true;
            "wikispecies".disabled = false;
            "wikispecies".weight = 0.5;
            "wikiversity".disabled = false;
            "wikiversity".weight = 0.5;
            "wikivoyage".disabled = false;
            "wikivoyage".weight = 0.5;
            "currency".disabled = true;
            "dictzone".disabled = true;
            "lingva".disabled = true;
            "bing images".disabled = false;
            "brave.images".disabled = false;
            "duckduckgo images".disabled = false;
            "google images".disabled = false;
            "qwant images".disabled = true;
            "1x".disabled = true;
            "artic".disabled = false;
            "deviantart".disabled = false;
            "flickr".disabled = true;
            "imgur".disabled = false;
            "library of congress".disabled = false;
            "material icons".disabled = true;
            "material icons".weight = 0.2;
            "openverse".disabled = false;
            "pinterest".disabled = true;
            "svgrepo".disabled = false;
            "unsplash".disabled = false;
            "wallhaven".disabled = false;
            "wikicommons.images".disabled = false;
            "yacy images".disabled = true;
            "bing videos".disabled = false;
            "brave.videos".disabled = true;
            "duckduckgo videos".disabled = true;
            "google videos".disabled = false;
            "qwant videos".disabled = false;
            "dailymotion".disabled = true;
            "google play movies".disabled = true;
            "invidious".disabled = true;
            "odysee".disabled = true;
            "peertube".disabled = true;
            "piped".disabled = true;
            "rumble".disabled = false;
            "sepiasearch".disabled = false;
            "vimeo".disabled = true;
            "youtube".disabled = false;
            "brave.news".disabled = true;
            "google news".disabled = true;
          };
          outgoing = {
            request_timeout = 5.0;
            max_request_timeout = 15.0;
            pool_connections = 100;
            pool_maxsize = 15;
            enable_http2 = true;
          };
          enabled_plugins = [
            "Basic Calculator"
            "Hash plugin"
            "Tor check plugin"
            "Open Access DOI rewrite"
            "Hostnames plugin"
            "Unit converter plugin"
            "Tracker URL remover"
          ];
        };
      };
    }
    // (
      if hostname == ceres.name then
        {
          caddy = {
            virtualHosts = {
              "${host}" = {
                extraConfig = ''
                  redir /.well-known/carddav /remote.php/dav/ 301
                  redir /.well-known/caldav /remote.php/dav/ 301

                  reverse_proxy ${localhost}:${toString service.ports.port0}

                  tls ${service.ssl.cert} ${service.ssl.key}
                '';
              };
            };
          };
        }
      else
        { }
    );

  users.groups.searx.members = [ "caddy" ];
  # systemd.services.caddy.serviceConfig.ProtectHome = false;

  sops =
    let
      sopsPath = secret: {
        path = "${service.sops.path0}/${service.name}-${secret}";
        owner = service.name;
        mode = "600";
      };
    in
    {
      secrets = builtins.listToAttrs (
        map
          (secret: {
            name = "${service.name}-${secret}";
            value = sopsPath secret;
          })
          [
            "key"
          ]
      );
    };

  networking = {
    firewall = {
      allowedTCPPorts = [
        service.ports.port0
      ];
    };
  };
}

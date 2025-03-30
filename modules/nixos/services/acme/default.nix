{
  config,
  flake,
  ...
}:
let
  inherit (flake.config.people) user0;
  inherit (flake.config.people.users.${user0}) email;
  inherit (flake.config.services) instances;
  domain0 = instances.web.domains.url0;
  domain1 = instances.web.domains.url1;
  domain3 = instances.web.domains.url3;
  dns = instances.web.dns.provider0;
  instanceName = service: (instances.${service}.subdomain);
  dnsConfig = {
    dnsProvider = dns;
    directory = instances.acme.paths.path0;
    environmentFile = config.sops.secrets."dns/namecheap".path;
  };
in
{
  security.acme = {
    acceptTerms = true;
    defaults = {
      email = email.address0;
      server = "https://acme-v02.api.letsencrypt.org/directory";
    };
    certs = builtins.listToAttrs (
      (map
        (service: {
          name = "${instanceName service}.${domain0}";
          value = dnsConfig;
        })
        [
          "jellyfin"
          "minecraft"
          "ollama"
          "syncthing"
          "searx"
          "vaultwarden"
          "audiobookshelf"
        ]
      )
      ++ (map
        (service: {
          name = "${instanceName service}.${domain3}";
          value = dnsConfig;
        })
        [
          "peertube"
          "forgejo"
          "mastodon"
        ]
      )
      ++ (map
        (name: {
          name = name;
          value = dnsConfig;
        })
        [
          domain0
          domain1
          domain3
        ]
      )
    );
  };
  sops =
    let
      sopsSecrets = [
        "pass"
      ];
      sopsPath = secret: {
        path = "/var/lib/secrets/${instances.acme.name}/${dns}-${secret}";
        owner = "root";
        mode = "600";
      };
    in
    {
      secrets = builtins.listToAttrs (
        map (secret: {
          name = "dns/${dns}";
          value = sopsPath secret;
        }) sopsSecrets
      );
    };
}

{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain3
    servicePath
    sslPath
    sopsPath
    ;

  mastodonLabel = "Mastodon";
  mastodonName = "mastodon";
  mastodonSubdomain = "social";
in
{
  label = mastodonLabel;
  name = mastodonName;
  email = {
    address0 = "noreply@${domain3}";
  };
  subdomain = mastodonSubdomain;
  sops = {
    path0 = "${sopsPath}/${mastodonName}";
  };
  paths = {
    path0 = "${servicePath}/${mastodonLabel}";
    path1 = "";
    path2 = "";
  };
  ssl = {
    cert = "${sslPath}/${mastodonSubdomain}.${domain3}/fullchain.pem";
    key = "${sslPath}/${mastodonSubdomain}.${domain3}/key.pem";
  };
}

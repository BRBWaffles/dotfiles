{ instancesFunctions }:
let
  inherit (instancesFunctions)
    domain0
    servicePath
    sslPath
    sopsPath
    ;

  ollamaLabel = "Ollama";
  ollamaName = "ollama";
in
{
  label = ollamaLabel;
  name = ollamaName;
  sops = {
    path0 = "${sopsPath}/${ollamaName}";
  };
  subdomain = ollamaName;
  paths = {
    path0 = "${servicePath}/${ollamaLabel}";
    path1 = "/mnt/media/storage/${ollamaName}";
  };
  ports = {
    port0 = 8088; # Open-WebUI (Ollama Front End)
    port1 = 11434; # Ollama API
  };
  ssl = {
    cert = "${sslPath}/${ollamaName}.${domain0}/fullchain.pem";
    key = "${sslPath}/${ollamaName}.${domain0}/key.pem";
  };
}

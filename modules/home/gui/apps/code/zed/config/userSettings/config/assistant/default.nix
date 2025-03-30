{
  flake,
  ...
}:
let
  inherit (flake.config.services.instances)
    ollama
    web
    ;
  service = ollama;
  localhost = web.localhost.address0;
in
{
  assistant = {
    enabled = true;
    default_model = {
      provider = "zed.dev";
      model = "claude-3-5-sonnet-latest";
    };
    version = "2";
  };
  assistant1 = {
    enabled = true;
    default_model = {
      provider = "ollama";
      model = "qwen2.5-coder:7b";
    };
    version = "2";
  };
  language_models = {
    ollama = {
      api_url = "http://${localhost}:${builtins.toString service.ports.port1}";
    };
  };
}

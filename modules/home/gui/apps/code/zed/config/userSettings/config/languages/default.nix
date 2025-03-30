{
  "Elixir" = {
    language_servers = [
      "!lexical"
      "elixir-ls"
      "!next-ls"
    ];
    format_on_save = {
      external = {
        command = "mix";
        arguments = [
          "format"
          "--stdin-filename"
          "{buffer_path}"
          "-"
        ];
      };
    };
  };
  "HEEX" = {
    language_servers = [
      "!lexical"
      "elixir-ls"
      "!next-ls"
    ];
    format_on_save = {
      external = {
        command = "mix";
        arguments = [
          "format"
          "--stdin-filename"
          "{buffer_path}"
          "-"
        ];
      };
    };
  };
  "Elm" = {
    language_servers = [ "elm-language-server" ];
    format_on_save = {
      external = {
        command = "elm-review";
        arguments = [ "--stdin" ];
      };
    };
  };
}

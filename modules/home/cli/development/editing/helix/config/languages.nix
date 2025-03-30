{
  language = [
    {
      auto-format = true;
      formatter.command = "nixfmt";
      name = "nix";
    }
    {
      auto-format = true;
      formatter.command = "cssfmt";
      name = "css";
    }
    {
      auto-format = true;
      language-servers = [
        "elm-language-server"
      ];
      name = "elm";
    }
    {
      auto-format = true;
      formatter.command = "haskell";
      name = "haskell";
    }
    {
      auto-format = true;
      formatter.command = "yamlfmt";
      name = "yaml";
    }
    {
      auto-format = true;
      formatter.command = "yuck";
      name = "yuck";
    }
  ];
  language-server = {
    elm-language-server = {
      config.elmLS = {
        disableElmLSDiagnostics = true;
        elmReviewDiagnostics = "warning";
      };
    };
  };
}

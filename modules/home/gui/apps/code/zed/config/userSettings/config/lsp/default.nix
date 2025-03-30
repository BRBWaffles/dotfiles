{
  rust-analyzer = {
    binary = {
      path_lookup = true;
    };
  };

  elm-language-server = {
    initialization_options = {
      disableElmLSDiagnostics = true;
      onlyUpdateDiagnosticsOnSave = false;
      elmReviewDiagnostics = "warning";
    };
  };

  haskell = {
    path_lookup = true;
  };

  nix = {
    binary = {
      path_lookup = true;
    };
  };

  typst = {
    binary = {
      path_lookup = true;
    };
  };

  elixir-ls = {
    binary = {
      path_lookup = true;
    };
    settings = {
      dialyzerEnabled = true;
    };
  };
}

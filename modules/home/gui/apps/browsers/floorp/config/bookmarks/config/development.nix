let
  gitlabTags = [
    "git"
    "gitlab"
  ];
  gitlabURL = "https://gitlab.com";
in
{
  name = "Development";
  toolbar = false;
  bookmarks = [
    {
      name = "Discord (Development Portal)";
      url = "https://discord.com/developers/applications";
      tags = [
        "discord"
        "development"
        "portal"
        "bot"
      ];
      keyword = "Discord";
    }
    {
      name = "Elm-UI";
      url = "https://package.elm-lang.org/packages/mdgriffith/elm-ui/latest/";
      tags = [
        "elm-ui"
        "elm"
        "ui"
      ];
      keyword = "Elm";
    }
    {
      name = "Elm Examples";
      url = "https://elm-lang.org/examples";
      tags = [
        "elm"
        "elm"
        "examples"
      ];
      keyword = "Elm";
    }
    {
      name = "GitHub";
      url = "https://github.com/BRBWaffles";
      tags = [
        "git"
        "github"
        "brbwaffles"
      ];
      keyword = "GitHub";
    }
    {
      name = "GitLab (Fallaryn)";
      url = "${gitlabURL}/fallaryn/dotfiles";
      tags = [
        "fallaryn"
      ] ++ gitlabTags;
      keyword = "GitLab";
    }
    {
      name = "GitLab (Isaac)";
      url = "${gitlabURL}/askyourself/dotfiles";
      tags = [
        "isaac"
        "askyourself"
      ] ++ gitlabTags;
      keyword = "GitLab";
    }
    {
      name = "GitLab (Nick)";
      url = "${gitlabURL}/upRootNutrition/dotfiles";
      tags = [
        "brbwaffles"
      ] ++ gitlabTags;
      keyword = "GitLab";
    }
    {
      name = "Hackage";
      url = "https://hackage.haskell.org";
      tags = [
        "hackage"
        "hack"
        "haskell"
      ];
      keyword = "Hack";
    }
    {
      name = "Discord-Haskell";
      url = "https://hackage.haskell.org/package/discord-haskell-1.17.1";
      tags = [
        "discord"
        "haskell"
      ];
      keyword = "Dack";
    }
  ];
}

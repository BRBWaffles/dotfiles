{
  pkgs,
  flake,
  ...
}:
let
  inherit (flake.config.people)
    user0
    ;
in
{
  programs.floorp =
    let
      configPath = ./config;
      bookmarksPath = import (configPath + /bookmarks) { inherit flake; };
      extensionsPath = import (configPath + /extensions) { inherit pkgs; };
      searchPath = import (configPath + /search) { inherit flake; };
      settingsPath = import (configPath + /settings);
      themesPath = import (configPath + /themes);
    in

    {
      enable = true;
      profiles = {
        ${user0} =
          {
            isDefault = true;
            id = 0;
          }
          // bookmarksPath
          // extensionsPath
          // searchPath
          // settingsPath
          // themesPath;
        testing =
          {
            isDefault = false;
            id = 1;
          }
          // bookmarksPath
          // searchPath
          // themesPath;
      };
    };
}

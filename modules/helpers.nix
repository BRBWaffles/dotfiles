{
  directoryImport =
    let
      collectDirs =
        path:
        let
          content = builtins.readDir path;
          subdirs = builtins.filter (name: content.${name} == "directory") (builtins.attrNames content);
          buildPath = name: path + "/${name}";

          thisDirs = map buildPath subdirs;
          subDirs = builtins.concatMap collectDirs thisDirs;
        in
        [ path ] ++ subDirs;
    in
    path:
    builtins.listToAttrs (
      map (dir: {
        name = baseNameOf (toString dir);
        value = import dir;
      }) (collectDirs path)
    );
}

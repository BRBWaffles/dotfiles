{
  time.timeZone = "America/Winnipeg";

  i18n =
    let
      locale = "en_CA.UTF-8";
    in
    {
      defaultLocale = locale;

      extraLocaleSettings = builtins.listToAttrs (
        map
          (option: {
            name = option;
            value = locale;
          })
          [
            "LC_ADDRESS"
            "LC_IDENTIFICATION"
            "LC_MEASUREMENT"
            "LC_MONETARY"
            "LC_NAME"
            "LC_NUMERIC"
            "LC_PAPER"
            "LC_TELEPHONE"
            "LC_TIME"
          ]
      );
    };
}

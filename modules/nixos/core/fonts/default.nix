{
  pkgs,
  flake,
  ...
}:
let
  inherit (flake.config.aesthetics.themes)
    fonts
    ;
in
{
  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          fonts.names.name0
        ];
        monospace = [
          fonts.names.name0
        ];
        sansSerif = [
          fonts.names.name0
        ];
        emoji = [
          "Noto Fonts Color Emoji"
        ];
      };
      antialias = true;
    };
    packages = builtins.attrValues {
      inherit (pkgs)
        noto-fonts-color-emoji
        dosis
        iosevka
        ;
      inherit (pkgs.nerd-fonts)
        _0xproto
        _3270
        agave
        anonymice
        arimo
        aurulent-sans-mono
        bigblue-terminal
        bitstream-vera-sans-mono
        blex-mono
        caskaydia-cove
        caskaydia-mono
        code-new-roman
        comic-shanns-mono
        commit-mono
        cousine
        d2coding
        daddy-time-mono
        dejavu-sans-mono
        departure-mono
        droid-sans-mono
        envy-code-r
        fantasque-sans-mono
        fira-code
        fira-mono
        geist-mono
        go-mono
        gohufont
        hack
        hasklug
        heavy-data
        hurmit
        im-writing
        inconsolata
        inconsolata-go
        inconsolata-lgc
        intone-mono
        iosevka-term
        iosevka-term-slab
        jetbrains-mono
        lekton
        liberation
        lilex
        martian-mono
        monaspace
        monofur
        monoid
        mononoki
        mplus
        noto
        open-dyslexic
        overpass
        profont
        proggy-clean-tt
        recursive-mono
        roboto-mono
        sauce-code-pro
        shure-tech-mono
        space-mono
        symbols-only
        terminess-ttf
        tinos
        ubuntu
        ubuntu-mono
        ubuntu-sans
        victor-mono
        zed-mono
        ;
    };
  };
}

{
  "1337x" = {
    definedAliases = [
      "@13"
    ];
    icon = ./icons/13.png;
    urls = [
      { template = "https://1337x.to/search/{searchTerms}/1/"; }
    ];
  };
  "Core Radio" = {
    definedAliases = [
      "@cr"
    ];
    icon = ./icons/cr.png;
    urls = [
      { template = "https://coreradio.online/?do=search&subaction=search&story={searchTerms}"; }
    ];
  };
  "The Pirate Bay" = {
    definedAliases = [
      "@pi"
    ];
    icon = ./icons/pi.png;
    urls = [
      {
        template = "https://thepiratebay.org/search.php?q={searchTerms}&all=on&search=Pirate+Search&page=0&orderby=";
      }
    ];
  };
  "Torrent Leech" = {
    definedAliases = [
      "@tl"
    ];
    icon = ./icons/tl.png;
    urls = [
      { template = "https://www.torrentleech.org/torrents/browse/index/query/{searchTerms}"; }
    ];
  };
  "VSTorrent" = {
    definedAliases = [
      "@vs"
    ];
    icon = ./icons/vs.png;
    urls = [
      { template = "https://vstorrent.org/?s={searchTerms}"; }
    ];
  };
}

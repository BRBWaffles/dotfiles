{
  "Amazon" = {
    definedAliases = [
      "@am"
    ];
    icon = ./icons/am.png;
    urls = [
      { template = "https://www.amazon.ca/s?k={searchTerms}&ref=nav_bb_sb"; }
    ];
  };
  "Door Dash" = {
    definedAliases = [
      "@do"
    ];
    icon = ./icons/do.png;
    urls = [
      { template = "https://www.doordash.com/search/store/{searchTerms}"; }
    ];
  };
  "FYT Supplies" = {
    definedAliases = [
      "@fy"
    ];
    icon = ./icons/fy.png;
    urls = [
      {
        template = "https://fytsupplies.ca/search?type=product%2Carticle%2Cpage%2Ccollection&options[prefix]=last&q={searchTerms}*";
      }
    ];
  };
  "Kijiji" = {
    definedAliases = [
      "@ki"
    ];
    icon = ./icons/ki.png;
    urls = [
      { template = "https://www.kijiji.ca/b-winnipeg/{searchTerms}"; }
    ];
  };
  "Memory Express" = {
    definedAliases = [
      "@me"
    ];
    icon = ./icons/me.png;
    urls = [
      { template = "https://www.memoryexpress.com/Search/Products?Search={searchTerms}"; }
    ];
  };
  "Skip The Dishes" = {
    definedAliases = [
      "@sk"
    ];
    icon = ./icons/sk.png;
    urls = [
      { template = "https://www.skipthedishes.com/winnipeg/items?search={searchTerms}"; }
    ];
  };
}

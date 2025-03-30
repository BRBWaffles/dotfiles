{
  pkgs,
  ...
}:
{
  home.packages = builtins.attrValues {
    inherit (pkgs)
      feishin
      ;
  };
  xdg.configFile."feishin.config.json".text = ''
    {
    	"window_has_frame": true,
    	"bounds": {
    		"x": 0,
    		"y": 0,
    		"width": 2560,
    		"height": 1080
    	},
    	"maximized": true,
    	"fullscreen": false,
    	"theme": "system",
    	"resume": true,
    	"lyrics": [
    		"Genius",
    		"lrclib.net",
    		"NetEase"
    	],
    	"window_window_bar_style": "linux",
    	"window_minimize_to_tray": false,
    	"window_enable_tray": false,
    	"window_start_minimized": false,
    	"window_exit_to_tray": false
      }'';
}

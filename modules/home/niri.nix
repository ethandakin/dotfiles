{ config, ... }: {
  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = false;

    spawn-at-startup = [
      { command = [ "noctalia-shell" ]; }
    ];

    binds = with config.lib.niri.actions; {
      "Mod+Shift+Slash".action = show-hotkey-overlay;

      "Mod+T".action.spawn = "wezterm";
      "Mod+T".hotkey-overlay.title = "Open a Terminal: wezterm";

      # Overview
      "Mod+O" = { repeat = false; action = toggle-overview; };

      # Window management
      "Mod+Q" = { repeat = false; action = close-window; };

      "Mod+Left".action  = focus-column-left;
      "Mod+Down".action  = focus-window-down;
      "Mod+Up".action    = focus-window-up;
      "Mod+Right".action = focus-column-right;
      "Mod+H".action     = focus-column-left;
      "Mod+J".action     = focus-window-down;
      "Mod+K".action     = focus-window-up;
      "Mod+L".action     = focus-column-right;
    };
  };  
}
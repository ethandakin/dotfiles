{ ... }: {
  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = false;

    binds = {
      "Mod+Shift+Slash".action = { show-hotkey-overlay = true };

      "Mod+T".action.spawn = "wezterm";
      "Mod+T".hotkey-overlay.title = "Open a Terminal: wezterm";

      # # Overview
      # "Mod+O" = { repeat = false; action = toggle-overview; };

      # # Window management
      # "Mod+Q" = { repeat = false; action = close-window; };

      # "Mod+Left".action  = focus-column-left;
      # "Mod+Down".action  = focus-window-down;
      # "Mod+Up".action    = focus-window-up;
      # "Mod+Right".action = focus-column-right;
      # "Mod+H".action     = focus-column-left;
      # "Mod+J".action     = focus-window-down;
      # "Mod+K".action     = focus-window-up;
      # "Mod+L".action     = focus-column-right;
    };
  };  
}
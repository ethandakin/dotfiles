{ ... }: {
  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = false;
    spawn-at-startup = [
      { command = [ "noctalia-shell" ]; }
    ];    
  };  
}
{ ... }: {
  programs.niri.settings = {
    spawn-at-startup = [
      { argv = [ "wezterm" ]; }
    ];
  };  
}
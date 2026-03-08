{ ... }: {
  programs.noctalia-shell = {
      enable = true;
  };

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "${../../assets/wallpaper.png}";
      wallpapers = {};
    };
  };  
}
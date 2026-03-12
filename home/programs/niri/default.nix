{ config, pkgs, ... }: {
  # disable niri flake config generation
  programs.niri.config = null;
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/home/niri/config.kdl";

  programs.noctalia-shell = {
      enable = true;
  };

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "${config.home.homeDirectory}/.dotfiles/assets/wallpaper.png";
      wallpapers = {};
    };
  };
}

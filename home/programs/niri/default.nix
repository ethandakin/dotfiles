{ config, pkgs, ... }: {
  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/programs/niri/config.kdl";
}

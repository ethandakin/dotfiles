{ config , ... }: {
    home.file.".config/waybar/config.jsonc" = {
    source = config.lib.file.mkOutOfStoreSymlink
        "/home/ethan/.dotfiles/home/programs/waybar/config.jsonc";
    };

    home.file.".config/waybar/style.css" = {
    source = config.lib.file.mkOutOfStoreSymlink
        "/home/ethan/.dotfiles/home/programs/waybar/style.css";
    };
}
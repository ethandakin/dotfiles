{ pkgs, ... }: {
  stylix.enable = true;

  #stylix.image = "${../../assets/wallpaper.png}";

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  stylix.polarity = "dark";
  
  stylix.autoEnable = true;
  stylix.targets.plymouth.colors.enable = false;
  stylix.targets.console.colors.enable = false;
  #stylix.targets.vscode.enable = false;
}

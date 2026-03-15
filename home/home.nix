{ pkgs, inputs, config, ... }: {
  imports = [
    ./programs/niri
    ./programs/firefox
    ./programs/git
    ./programs/ssh
  ];

  home.packages = with pkgs; [
    nil
    nixfmt
    bitwarden-desktop
  ];

  programs.alacritty.enable = true;
  programs.wezterm.enable = true;
  programs.vscode.enable = true;
  programs.fuzzel.enable = true;

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };

  programs.waybar.enable = true;

  home.stateVersion = "26.05";
}

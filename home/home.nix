{ pkgs, inputs, config, ... }: {
  imports = [
    ./programs/niri
    ./programs/firefox
    ./programs/git
    ./programs/ssh
    ./programs/vicinae
    ./programs/noctalia
  ];

  home.packages = with pkgs; [
    nil
    nixfmt
    bitwarden-desktop
    kdePackages.qt6ct
    gtk3
    gtk4
  ];

  programs.alacritty.enable = true;
  programs.wezterm.enable = true;
  programs.vscode.enable = true;
  programs.fuzzel.enable = true;
  programs.fastfetch.enable = true;

  services.tailscale-systray.enable = true;

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
    platformTheme.name = "gtk4";
    style.name = "adwaita-dark";
  };

  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };

  home.stateVersion = "26.05";
}

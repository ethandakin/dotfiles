{ pkgs, inputs, config, ... }: {
  imports = [
    ./programs/firefox
    ./programs/git
    ./programs/ssh
    ./programs/vicinae
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
  programs.fastfetch.enable = true;

  services.tailscale-systray.enable = true;

  home.stateVersion = "26.05";
}

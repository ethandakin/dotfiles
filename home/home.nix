{ pkgs, ... }: {
  imports = [
    ../modules/home/niri.nix
  ];

  programs.wezterm.enable = true;
  programs.git.enable = true;

  programs.ssh = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
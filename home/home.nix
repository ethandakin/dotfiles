{ pkgs, ... }: {
  imports = [
    ../modules/home/niri.nix
    ../modules/home/dms.nix
  ];

  programs.wezterm.enable = true;

  home.stateVersion = "26.05";
}
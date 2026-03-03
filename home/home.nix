{ pkgs, ... }: {
  imports = [
    ../modules/home/niri.nix
    ../modules/home/dms.nix
  ];

  home.stateVersion = "26.05";
}
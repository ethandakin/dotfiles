{ pkgs, ... }: {
  imports = [
    ../modules/home/dms.nix
  ];

  home.stateVersion = "26.05";
}
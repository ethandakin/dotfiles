{ inputs, pkgs, ... }:

{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = {
    # apparently this should be disabled at first for the binary cache?
    enable = true;
    package = pkgs.niri-unstable;
  };
}
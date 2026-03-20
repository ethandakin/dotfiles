{ inputs, ... }:

{
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.enable = true;
}

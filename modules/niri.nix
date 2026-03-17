{ inputs, pkgs, ... }: {
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable.overrideAttrs (_: {
      src = inputs.niri-blur;
      cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
        src = inputs.niri-blur;
        hash = "sha256-F6dT3xBWsjN+pGT3D2PvoqiWJpY/Rv8TkEBX1fthzYs=";
      };
    });
  };
}
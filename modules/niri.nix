{ inputs, ... }: {
  programs.niri.enable = true;
  programs.niri.package = inputs.niri.packages.x86_64-linux.niri;
}

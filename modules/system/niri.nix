{ pkgs, ... }: {
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;

  # avoid conflict with dms
  systemd.user.services.niri-flake-polkit.enable = false;
}
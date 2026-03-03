{ pkgs, ... }: {
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;

  services.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # avoid conflict with dms
  systemd.user.services.niri-flake-polkit.enable = false;
}
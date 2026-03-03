{ pkgs, ... }: {
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;

  programs.niri.settings = {
    hotkey-overlay.skip-at-startup = true;
  };

  # avoid conflict with dms
  systemd.user.services.niri-flake-polkit.enable = false;
}
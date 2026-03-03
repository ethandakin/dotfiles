{ ... }: {
  #programs.niri.enable = true;

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "niri-session";
      user = "ethan";
    };
  };

  # avoid conflict with dms
  systemd.user.services.niri-flake-polkit.enable = false;
}
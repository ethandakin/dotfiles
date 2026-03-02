{ pkgs, ... }: {
  programs.niri.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "niri-session";
        user = "ethan";
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "*";
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
{ self, inputs, ... }: {
  flake.nixosModules.desktop = { pkgs, ... }:
    let
      theme-name = "Tokyonight-Dark";
      theme = pkgs.tokyonight-gtk-theme.override {
        colorVariants = [ "dark" ];
        sizeVariants = [ "standard" ];
        themeVariants = [ "default" ];
      };
    in {
      nixpkgs.overlays = [ inputs.niri.overlays.niri ];

      programs.niri = {
        enable = true;
        package = pkgs.niri;
      };

      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };

      programs.dconf = {
        enable = true;
        profiles.user.databases = [
          {
            lockAll = false;
            settings = {
              "ca/desrt/dconf-editor" = {
                show-warning = false;
              };
              "org/gnome/desktop/interface" = {
                gtk-theme = theme-name;
                icon-theme = "Adwaita";
                color-scheme = "prefer-dark";
                gtk-enable-primary-paste = false;
              };
            };
          }
        ];
      };

      services.displayManager.ly.enable = true;      

      environment.systemPackages = [
        theme
        pkgs.adwaita-icon-theme
        pkgs.nautilus
        pkgs.gtk3
        pkgs.gtk4
        pkgs.xwayland-satellite
      ];

      xdg.portal = {
        enable = true;
        extraPortals = [
          pkgs.xdg-desktop-portal-wlr
          pkgs.xdg-desktop-portal-gtk
          # Remove xdg-desktop-portal-gnome entirely
        ];
        config = {
          niri = {
            default = [ "wlr" "gtk" ];
            "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
            "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
          };
        };
      };

      services.gvfs.enable = true;
    };
}
{ ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0;

  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "splash" "udev.log_level=0" ];


  boot.plymouth = {
    enable = true;
    themePackages = [ pkgs.nixos-plymouth-theme ];
    theme = "nixos-bgrt";
  };

  boot.initrd.systemd.enable = true;  
}
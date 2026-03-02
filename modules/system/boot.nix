{ ... }: {
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "splash" "udev.log_level=0" ];


  boot.plymouth = {
    enable = true;
    theme = "spinner";
  };

  boot.initrd.systemd.enable = true;  
}
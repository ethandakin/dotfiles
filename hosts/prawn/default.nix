{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/nix.nix
    ../../modules/system/boot.nix
    ../../modules/system/locale.nix
    ../../modules/system/audio.nix
    ../../modules/system/networking.nix
    ../../modules/system/sddm.nix
    ../../modules/system/niri.nix
    ../../modules/system/fonts.nix
  ];

  networking.hostName = "prawn";
  
  users.users.ethan = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };
  
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.tuned.enable;
  services.upower.enable;

  services.fwupd.enable = true;
  services.libinput.enable = true;
  services.thermald.enable = true;  

  system.stateVersion = "26.05";
}
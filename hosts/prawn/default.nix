{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/audio.nix
    ../../modules/system/boot.nix
    ../../modules/system/dms.nix
    ../../modules/system/locale.nix
    ../../modules/system/networking.nix
    ../../modules/system/niri.nix
    ../../modules/system/nix.nix
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

  services.fwupd.enable = true;
  services.libinput.enable = true;
  services.thermald.enable = true;  
}
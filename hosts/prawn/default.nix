{ pkgs, lib, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nix.nix
    ../../modules/boot.nix
    ../../modules/locale.nix
    ../../modules/audio.nix
    ../../modules/networking.nix
    ../../modules/fonts.nix
    ../../modules/desktop.nix
  ];

  networking.hostName = "prawn";
  
  users.users.ethan = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  services.vscode-server.enable = true;
  system.stateVersion = "26.05";
}

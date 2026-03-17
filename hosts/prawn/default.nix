{ pkgs, lib, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nix.nix
    ../../modules/boot.nix
    ../../modules/locale.nix
    ../../modules/audio.nix
    ../../modules/networking.nix
    ../../modules/sddm.nix
    ../../modules/niri.nix
    ../../modules/fonts.nix
  ];

  networking.hostName = "prawn";
  
  users.users.ethan = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };

  environment.systemPackages = [
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    pkgs.brightnessctl
    pkgs.kdePackages.layer-shell-qt
  ]; 
  
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };

  services.gnome.gcr-ssh-agent.enable = false;

  services.fwupd.enable = true;
  services.libinput.enable = true;
  services.thermald.enable = true;
  services.tuned.enable = true;
  services.upower.enable = true;

  services.vscode-server.enable = true;
  system.stateVersion = "26.05";
}

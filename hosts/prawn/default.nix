{ pkgs, lib, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/audio.nix
    ../../modules/boot.nix
    ../../modules/desktop.nix
    ../../modules/fonts.nix
    ../../modules/hjem.nix
    ../../modules/locale.nix
    ../../modules/networking.nix
    ../../modules/nix.nix
    ../../modules/user.nix
  ];

  networking.hostName = "prawn";

  environment.systemPackages = with pkgs; [
    swaybg
    alacritty
    wezterm
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    fuzzel
    fastfetch
    git
  ];
  
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

{ pkgs, ... }: {
  imports = [
    ../modules/home/niri.nix
    ../modules/home/dms.nix
  ];

  home.packages = with pkgs; [
    bitwarden-desktop 
  ]; 

  programs.wezterm.enable = true;
  programs.alacritty.enable = true;
  programs.git.enable = true;

  programs.ssh = {
    enable = true;
    extraConfig = ''
      IdentityAgent ~/.bitwarden-ssh-agent.sock
    '';
    matchBlocks."github.com" = {
      hostname = "github.com";
      user = "git";
    };
  };

  home.stateVersion = "26.05";
}
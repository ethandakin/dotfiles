{ pkgs, inputs, config, ... }: {
  imports = [
    ../modules/home/niri.nix
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    nil
    nixfmt
    bitwarden-desktop
  ];

  programs.wezterm.enable = true;
  programs.firefox.enable = true;
  programs.vscode.enable = true;
  programs.git = {
    enable = true;
    userName = "ethandakin";
    userEmail = "ethand@outlook.com.au";
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "/home/${config.home.username}/.bitwarden-ssh-agent.sock";
  };  

  home.stateVersion = "26.05";
}

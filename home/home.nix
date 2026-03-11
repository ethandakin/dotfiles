{ pkgs, inputs, config, ... }: {
  imports = [
    ../modules/home/niri
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    nil
    nixfmt
    bitwarden-desktop
  ];

  programs.wezterm = {
    enable = true;
    extraConfig = '' 
      local wezterm = require("wezterm")
      local config = wezterm.config_builder()

      config.mux_enable_ssh_agent = false

      return config
    '';
  };

  programs.firefox = {
    package = pkgs.firefox-devedition;
    enable = true;
  };

  stylix.targets.firefox.enable = false;
  programs.vscode.enable = true;

  home.file.".ssh/allowed_signers".text = ''
    ethand@outlook.com.au ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDkZzuL3uE9EWO6ZZP57hjMefwQh72riuxG3m/QGRgsP
  '';

  programs.git = {
    enable = true;
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDkZzuL3uE9EWO6ZZP57hjMefwQh72riuxG3m/QGRgsP";
      signByDefault = true;
    };
    settings = {
      user.name = "ethandakin";
      user.email = "ethand@outlook.com.au";
      
      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = "/home/${config.home.username}/.ssh/allowed_signers";
      };
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      extraOptions = {
        IdentityAgent = "/home/${config.home.username}/.bitwarden-ssh-agent.sock";
      };
    };
  };


  programs.niri.settings.environment = {
    SSH_AUTH_SOCK = "/home/${config.home.username}/.bitwarden-ssh-agent.sock";
  };

  home.stateVersion = "26.05";
}

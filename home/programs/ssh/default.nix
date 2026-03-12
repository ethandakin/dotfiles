{ config, ... }: {
  home.file.".ssh/allowed_signers".text = ''
    ethand@outlook.com.au ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDkZzuL3uE9EWO6ZZP57hjMefwQh72riuxG3m/QGRgsP
  '';

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      extraOptions = {
        IdentityAgent = "/home/${config.home.username}/.bitwarden-ssh-agent.sock";
      };
    };
  };    
}
{ ... }: {
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
}
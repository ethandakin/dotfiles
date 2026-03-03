{ pkgs, inputs, ... }: {

  programs.silentSDDM = {
    enable = true;
    theme = "catppuccin-macchiato";
  };

  services.libinput.enable = true;
}
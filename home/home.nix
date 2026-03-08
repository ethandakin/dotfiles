{ pkgs, inputs, ... }: {
  imports = [
    ../modules/home/niri.nix
    inputs.noctalia.homeModules.default
    ../modules/home/noctalia.nix
  ];

  home.packages = [
    pkgs.nil
    pkgs.nixfmt
  ];

  programs.wezterm.enable = true;
  programs.git = {
    enable = true;
    userName = "ethandakin";
    userEmail = "ethand@outlook.com.au";
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
  };

  home.stateVersion = "26.05";
}

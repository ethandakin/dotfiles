{ pkgs, inputs, config, ... }: {
  imports = [
    ./programs/niri
    ./programs/firefox
    ./programs/git
    ./programs/ssh
    inputs.noctalia.homeModules.default
  ];

  home.packages = with pkgs; [
    nil
    nixfmt
    bitwarden-desktop
  ];

  programs.wezterm.enable = true;
  programs.vscode.enable = true;
  home.stateVersion = "26.05";
}

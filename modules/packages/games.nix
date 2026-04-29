# my common software between my machines

{ self, inputs, ... }: {
  flake.nixosModules.games = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
      package = pkgs.steam.override {
        extraPkgs = pkgs: with pkgs; [
          gamemode
          mangohud
        ];
      };
    };

    programs.gamemode.enable = true;

    environment.variables = {
      PROTON_ENABLE_WAYLAND = "1";
      DXVK_ASYNC = "1";
      VKD3D_CONFIG = "dxr";
    };
  };
}
{
  description = "ethan's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };   

    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
      inputs.nixpkgs.follows = "nixpkgs";
    };    
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
  let
    mkHost = host: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/${host}
        inputs.niri.nixosModules.niri
        inputs.stylix.nixosModules.stylix
        inputs.silentSDDM.nixosModules.default
        inputs.vscode-server.nixosModules.default
        { nixpkgs.overlays = [ inputs.niri.overlays.niri ]; }
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.ethan = import ./home/home.nix;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.sharedModules = [];
        }
      ];
    };
  in {
    nixosConfigurations = {
      prawn = mkHost "prawn";
    };
  };
}

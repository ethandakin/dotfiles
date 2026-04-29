{ self, inputs, ... }: {
  flake.nixosModules.networking = { ... }: {
    networking.networkmanager.enable = true;

    networking.firewall = {
      enable = true;
      # ssh
      allowedTCPPorts = [ 22 ];
    };

    services.tailscale.enable = true;
  };
}
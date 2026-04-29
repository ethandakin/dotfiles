{ self, inputs, ... }: {
  flake.nixosModules.hjem = { pkgs, ... }: {
    # probably should do this better but i dont rlly care right now
    hjem.users.ethan = {
      directory = "/home/ethan";
      files = {
        ".ssh/allowed_signers".source = ../../home/ssh/allowed_signers;
        ".gitconfig".source = ../../home/gitconfig;

        ".config/niri/config.kdl".source = ../../home/niri/config.kdl;
        # copies instead of symlinks
        ".config/noctalia/colors.json" = {
          source = ../../home/noctalia/colors.json;
          type = "copy";
          permissions = "644";
        };
        ".config/noctalia/settings.json" = {
          source = ../../home/noctalia/settings.json;
          type = "copy";
          permissions = "644";
        };
      };
    };  
  };
}
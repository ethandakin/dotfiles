{ ... }:

{
  hjem.users.ethan = {
    directory = "/home/ethan";
    files = {
      ".config/niri/config.kdl".source = ../home/niri/config.kdl;
      # copies instead of symlinks
      ".config/niri/noctalia.kdl" = {
        source = ../home/niri/noctalia.kdl;
        type = "copy";
        permissions = "644";
      };
      ".config/noctalia/colors.json" = {
        source = ../home/noctalia/colors.json;
        type = "copy";
        permissions = "644";
      };
      ".config/noctalia/settings.json" = {
        source = ../home/noctalia/settings.json;
        type = "copy";
        permissions = "644";
      };
    };
  };
}


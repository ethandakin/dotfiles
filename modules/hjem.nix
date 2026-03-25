{ ... }:

{
  hjem.users.ethan = {
    directory = "/home/ethan";
    files = {
      ".config/niri/config.kdl".source = ../home/niri/config.kdl;
      ".config/noctalia/colors.json".source = ../home/noctalia/colors.json;
      ".config/noctalia/settings.json".source = ../home/noctalia/settings.json;
    };
  };
}
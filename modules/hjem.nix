{ ... }:

{
  hjem.users.ethan = {
    directory = "/home/ethan";
    files = {
      ".config/niri/config.kdl".source = ../home/niri/config.kdl;
    };
  };
}
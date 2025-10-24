{
  lib,
  pkgs,
  ...
}:

{
  networking.hostName = "mac";

  users.users.pingu = {
    name = "pingu";
    home = "/Users/pingu";
  };

  home-manager.users.pingu.home = {
    stateVersion = "25.05";
    homeDirectory = "/Users/pingu";
  };

  system.stateVersion = 5;
}

{
  lib,
  pkgs,
  ...
}:

{
  networking.hostName = "mac";

    programs.zsh.enable = true;

  users.users.pingu = {
    name = "pingu";
    home = "/Users/pingu";
    shell = pkgs.zsh;
  };

  home-manager.users.pingu.home = {
    stateVersion = "25.05";
    homeDirectory = "/Users/pingu";
  };

  system.stateVersion = 5;
}

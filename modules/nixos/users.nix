{ pkgs, ... }:
{
  networking.hostName = "nixos";

  users.users.pingu = {
    isNormalUser = true;
    description = "Pingu User";
    home = "/home/pingu";
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "changeme";
  };

  security.sudo.wheelNeedsPassword = true;

  home-manager.users.pingu = {
    home = {
      stateVersion = "25.05";
      homeDirectory = "/home/pingu";
      username = "pingu";
    };
    programs.bash.enable = true;
  };

  users.defaultUserShell = pkgs.bash;

  system.stateVersion = "25.05";
}

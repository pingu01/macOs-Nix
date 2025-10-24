{ pkgs, ... }:
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ "root" "pingu" ];
    };
    optimise.automatic = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  
  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config.allowUnfree = true;
  };
  
  environment.systemPackages = with pkgs; [
    vim git curl wget
  ];
  
  system.stateVersion = "25.05";
}

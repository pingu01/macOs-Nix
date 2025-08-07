{ config, lib, pkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      trusted-users = [ "root" "pingu" ];  # Replace with your username
    };
    
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };
  
  # Platform configuration
  nixpkgs = {
    hostPlatform = "aarch64-darwin";  # or "x86_64-darwin"
    config.allowUnfree = true;
  };
  
  system.stateVersion = 5;
}
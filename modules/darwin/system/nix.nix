{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    deploy-rs
    nh
    nil
    nix-index
    nix-output-monitor
    nixd
    nixfmt-rfc-style
  ];

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [ "root" "pingu" ];  # Replace with your username
    };

    optimise.automatic = true;
    
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };
  
  
  
  # Platform configuration
  nixpkgs = {
    hostPlatform = "aarch64-darwin";  # or "x86_64-darwin"
    config.allowUnfree = true;
    config.allowBroken = true;
  };
  
  system.stateVersion = 5;
}
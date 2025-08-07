{
  description = "My Darwin system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # Enable Nix flakes
      nix.settings.experimental-features = "nix-command flakes";
      
      # Set system state version
      system.stateVersion = 5;
      
      # Basic packages
      environment.systemPackages = with pkgs; [
        git
        vim
        curl
        wget
        neovim
        
      ];
      
      # Set platform (change to x86_64-darwin for Intel Macs)
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Replace "YourMacName" with your actual hostname or any name you prefer
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}

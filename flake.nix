{
  description = "My Darwin system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  {
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [
        # Inline system configuration - no external modules
        {
          nix.settings.experimental-features = "nix-command flakes";
          system.stateVersion = 5;
          nixpkgs.hostPlatform = "aarch64-darwin";
          nixpkgs.config.allowUnfree = true;
          
          environment.systemPackages = with nixpkgs.legacyPackages.aarch64-darwin; [
            git
            vim
            curl
          ];
        }
        
        # Home Manager with inline configuration
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pingu = { pkgs, ... }: {
            # Required settings
            home.username = "pingu";
            home.homeDirectory = "/Users/pingu";
            home.stateVersion = "23.11";
            
            # Packages
            home.packages = with pkgs; [
              nodejs
              python3
            ];
            
            # Programs
            programs.git = {
              enable = true;
              userName = "Pingu";
              userEmail = "pingu@example.com";
            };
            
            programs.zsh = {
              enable = true;
              shellAliases.ll = "ls -la";
            };
          };
        }
      ];
    };
  };
}

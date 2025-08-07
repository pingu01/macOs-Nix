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
        # Import your modular configuration
        ./modules
        
        # Home Manager integration
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pingu = { # Replace 'pingu' with your username
            imports = [ ./modules ];
            home.stateVersion = "23.11";  # Add this line
          };
        }
      ];
    };
  };
}
{
  description = "My Darwin system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    configuration = { pkgs, ... }: {
      # Import only system modules for Darwin
      imports = [ ./modules/system ];
      
      # Enable Nix daemon
      services.nix-daemon.enable = true;
    };
    
    homeConfiguration = { pkgs, ... }: {
      # Import your home-manager modules
      imports = [ ./modules/programs ];
      
      # Home Manager settings
      home.username = "pingu";  # Replace with your actual username
      home.homeDirectory = "/Users/pingu";  # Replace with your actual username
      home.stateVersion = "23.05";
      
      # Let Home Manager install and manage itself
      programs.home-manager.enable = true;
    };
  in
  {
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [
        configuration
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.pingu = homeConfiguration;  # Replace with your actual username
        }
      ];
    };
  };
}
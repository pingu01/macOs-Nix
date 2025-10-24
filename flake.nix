{
  description = "Multi-platform Nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nix-darwin, home-manager, nixpkgs }: {
    # macOS configuration
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      modules = [
        ./hosts/mac
        ./modules/darwin
        home-manager.darwinModules.default
      ];
    };

    # NixOS configuration
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/nixos
        ./modules/nixos
        home-manager.nixosModules.default
      ];
    };
  };
}

{
  description = "My Darwin system configuration";

  nixConfig = {
    extra-substituters = [
      # "https://cache.r3dlust.com/"
      "https://cache.garnix.io/"
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      # "https://cache.flakehub.com"
    ];

    extra-trusted-public-keys = [
      # "cache.r3dlust.com:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      # "cache.flakehub.com-1:t6986ugxCA+d/ZF6IzeE2XmLZNMCfHdPIHPPkNF8cTQ="
    ];

    experimental-features = [
      "cgroups"
      "flakes"
      "nix-command"
      "pipe-operators"
    ];

    builders-use-substitutes = true;
    flake-registry = "";
    http-connections = 50;
    lazy-trees = true;
    show-trace = true;
    trusted-users = [
      "root"
      "@wheel"
      "@admin"
    ];
    use-cgroups = true;
    warn-dirty = false;
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    # inclui home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      users = {
        pingu.home = {
          stateVersion = "25.05";
          homeDirectory = "/Users/pingu";
        };
      };
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }:
  {
    # Replace "YourMacName" with your actual hostname or any name you prefer
    darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
      # chama submodulo e nao o modulo definido local
      modules = [
        ./modules
      ];
    };
  };
}
{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Languages
    nodejs
    python3
    rustc
    cargo
    go
    
    # CLI tools
    ripgrep
    fd
    bat
    jq
    tree
    htop
    
    # Build tools
    gnumake
    cmake
    
    # Network tools
    httpie
    
    # Archives
    unzip
    zip
  ];
  
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
}
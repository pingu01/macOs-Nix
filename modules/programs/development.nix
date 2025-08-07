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
    
  
    httpie
    
    # Archives
    unzip
    zip

    nmap
    ffuf
    gobuster
    sqlmap
    nikto
    metasploit
    theharvester
  ];
  
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
}
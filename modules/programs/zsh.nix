{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      share = true;
    };
    
    shellAliases = {
      ll = "ls -la";
      la = "ls -A";
      ".." = "cd ..";
      "..." = "cd ../..";
      
      # Git shortcuts
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      
      # Nix shortcuts
      nrs = "darwin-rebuild switch --flake ~/Github/macOs-Nix";
      hms = "home-manager switch";
    };
    
    # Use initExtra instead of promptInit for Home Manager
    initExtra = ''
      # Custom prompt
      autoload -U colors && colors
      PS1="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%# "
      
      # Custom functions
      function mkcd() {
        mkdir -p "$1" && cd "$1"
      }
      
      # Better history search
      bindkey '^R' history-incremental-search-backward
    '';
  };
}

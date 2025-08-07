{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    # Zsh options
    setopt = [
      "HIST_IGNORE_DUPS"      # Don't record duplicate commands
      "HIST_FIND_NO_DUPS"     # Don't display duplicates when searching
      "HIST_REDUCE_BLANKS"    # Remove extra blanks from commands
      "SHARE_HISTORY"         # Share history between sessions
      "APPEND_HISTORY"        # Append to history file
      "AUTO_CD"               # cd by typing directory name
      "CORRECT"               # Try to correct spelling of commands
    ];
    
    # History configuration
    history = {
      size = 10000;
      save = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      share = true;
      extended = true;
    };
    
    # Shell aliases
    shellAliases = {
      # Basic commands
      ll = "ls -la";
      la = "ls -A";
      l = "ls -CF";
      ".." = "cd ..";
      "..." = "cd ../..";
      
      # Git shortcuts
      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git pull";
      gd = "git diff";
      
      # Nix shortcuts
      nrs = "darwin-rebuild switch --flake ~/Github/macOs-Nix";
      nrb = "darwin-rebuild build --flake ~/Github/macOs-Nix";
      hms = "home-manager switch";
      
      # Utilities
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
    };
    
    # Custom prompt
    promptInit = ''
      # Simple colorful prompt
      autoload -U colors && colors
      PS1="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%# "
    '';
    
    # Additional configuration
    initExtra = ''
      # Custom functions
      function mkcd() {
        mkdir -p "$1" && cd "$1"
      }
      
      # Better history search
      bindkey '^R' history-incremental-search-backward
      
      # Edit command line in $EDITOR
      autoload -U edit-command-line
      zle -N edit-command-line
      bindkey '^X^E' edit-command-line
    '';
  };
}
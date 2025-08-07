{ config, lib, pkgs, ... }:

with lib;

{
  programs.git = {
    enable = true;
    userName = "pingu01";
    userEmail = "gabrielmnascimento04@gmail.com";
    
    # Global git settings
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      
      # Better diffs
      diff = {
        algorithm = "patience";
        compactionHeuristic = true;
      };
      
      # Signing commits
      commit.gpgsign = false;  # Set to true if you want signed commits
      
      # URL shortcuts
      url = {
        "https://github.com/".insteadOf = "gh:";
        "https://gitlab.com/".insteadOf = "gl:";
      };
    };
    
    # Git aliases
    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      ci = "commit";
      ca = "commit -a";
      ps = "push";
      pl = "pull";
      lg = "log --oneline --graph --decorate";
      ll = "log --pretty=format:'%h %ad %s (%an)' --date=short";
      unstage = "reset HEAD --";
      last = "log -1 HEAD";
      visual = "!gitk";
    };
    
    # Global gitignore
    ignores = [
      # macOS
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"
      
      # IDEs
      ".vscode/"
      ".idea/"
      "*.swp"
      "*.swo"
      "*~"
      
      # Languages
      "node_modules/"
      "*.pyc"
      "__pycache__/"
      "target/"
      ".cargo/"
    ];
  };
}
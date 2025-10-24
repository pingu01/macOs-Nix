{
  config,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    {
      programs.zsh = {
        enable = true;
        enableCompletion = true;  # Changed from enableCompletions
        autosuggestion.enable = true;  # Also note: autosuggestion (singular)
        syntaxHighlighting.enable = true;
        shellAliases = {
          ll = "ls -l";
          update = "sudo nixos-rebuild switch";
        };
        history.size = 10000;
      };
    }
  ];
}

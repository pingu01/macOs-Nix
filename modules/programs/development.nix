{
  config,
  lib,
  pkgs,
  ...
}:

{
  home-manager.sharedModules = [
    {
      home.packages = with pkgs; [
        nodejs
        python3
        rustc
        cargo
        go

        ripgrep
        fd
        bat
        jq
        tree
        htop

        gnumake
        cmake
        httpie

      ];

      programs.direnv = {
        enable = true;
        enableZshIntegration = true;
      };
    }
  ];
}

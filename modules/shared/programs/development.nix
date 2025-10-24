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
        nh

        nodejs
        python3
        rustc
        zulu25
        cargo
        clippy
        rustfmt
        rust-analyzer

        go
        bun
        pipx

        ripgrep
        fd
        bat
        jq
        tree
        htop

        gnumake
        cmake
        httpie
        wireguard-ui
        neovim

      ];

      programs.direnv = {
        enable = true;
        enableZshIntegration = true;
      };
    }
  ];
}

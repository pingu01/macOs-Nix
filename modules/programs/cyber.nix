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
        nmap
        ffuf
        gobuster
        sqlmap
        nikto
        metasploit
        theharvester
        mitmproxy
      ];

       programs.direnv = {
        enable = true;
        enableZshIntegration = true;
      };
    }
  ];
}

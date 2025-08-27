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
        openvpn
        samba4Full
        python313Packages.impacket
        evil-winrm
      ];

       programs.direnv = {
        enable = true;
        enableZshIntegration = true;
      };
    }
  ];
}

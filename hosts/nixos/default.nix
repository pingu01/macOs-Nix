{ ... }:
{
  imports = [ ./hardware-configuration.nix ];
  
  services.openssh.enable = true;
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
}

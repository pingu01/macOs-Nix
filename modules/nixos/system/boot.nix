{ ... }:
{
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };
  networking.networkmanager.enable = true;
}

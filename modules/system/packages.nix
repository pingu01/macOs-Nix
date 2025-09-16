{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    curl
    wget
    htop
    tree
    jellyfin-ffmpeg
    iproute2mac
  ];
}
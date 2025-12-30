{ pkgs, ... }:

{
  imports = [
    ../../hardware/akihabara
  ];

  networking.hostName = "akihabara";

  modules = {
    cloudflared.enable = true;
    jellyfin.enable = true;
    glances.enable = true;
    systemd-boot.enable = true;
    sops.enable = true;
  };
}

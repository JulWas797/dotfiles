{ pkgs, ... }:

{
  imports = [
    ../../hardware/akihabara
  ];

  networking.hostName = "akihabara";

  modules = {
    cloudflared.enable = true;
    jellyfin.enable = true;
    jenkins.enable = true;
    glances.enable = true;
    maven.enable = true;
    systemd-boot.enable = true;
    sops.enable = true;
    forgejo.enable = true;
    flood.enable = true;
  };
}

{ pkgs, ... }:

{
  imports = [
    ../../hardware/akihabara
  ];

  networking.hostName = "akihabara";

  modules = {
    jellyfin.enable = true;
    glances.enable = true;
    systemd-boot.enable = true;
  };
}

{ pkgs, ... }:

{
  imports = [
    ../../hardware/akihabara
  ];

  networking.hostName = "akihabara";

  modules = {
    glances.enable = true;
    systemd-boot.enable = true;
  };
}

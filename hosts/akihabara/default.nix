{ pkgs, ... }:

{
  imports = [
    ../../hardware/akihabara
  ];

  networking.hostName = "akihabara";

  modules = {
    systemd-boot.enable = true;
  };
}

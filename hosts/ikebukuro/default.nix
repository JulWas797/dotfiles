{ pkgs, ... }:

{
  imports = [
    ../../hardware/ikebukuro
  ];

  networking.hostName = "ikebukuro";

  modules = {
    _1password.enable = true;
    fonts.enable = true;
    greetd.enable = true;
    networking.enable = true;
    pipewire.enable = true;
    power.enable = true;
    sops.enable = true;
    sway.enable = true;
    systemd-boot.enable = true;
  };
}

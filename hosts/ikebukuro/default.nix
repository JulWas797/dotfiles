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
    pipewire.enable = true;
    power.enable = true;
    sway.enable = true;
    systemd-boot.enable = true;
    userapps.enable = true;
  };
}

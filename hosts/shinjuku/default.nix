{ ... }:

{
  imports = [
    ../../hardware/shinjuku
  ];

  modules = {
    _1password.enable = true;
    kde.enable = true;
    pipewire.enable = true;
    plymouth.enable = true;
    sddm.enable = true;
    systemd-boot.enable = true;
    userapps.enable = true;
  };
}
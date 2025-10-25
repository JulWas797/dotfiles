{ ... }:

{
  imports = [
    ../../hardware/nyanix
  ];

  modules = {
    _1password.enable = true;
    gaming.enable = true;
    java.enable = true;
    kde.enable = true;

    pipewire = {
      enable = true;
      hifi = true;
    };

    plymouth.enable = true;
    sddm.enable = true;
    systemd-boot.enable = true;
    userapps.enable = true;
  };
}
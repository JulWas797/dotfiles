{ ... }:

{
  imports = [
    ../../hardware/nyanix
  ];

  networking.hostName = "nyanix";

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
    podman.enable = true;
    sddm.enable = true;
    systemd-boot.enable = true;
    tuned.enable = true;
    userapps.enable = true;
  };
}
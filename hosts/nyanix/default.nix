{ ... }:

{
  imports = [
    ../../hardware/nyanix
  ];

  networking.hostName = "nyanix";

  modules = {
    _1password.enable = true;
    fonts.enable = true;
    gaming.enable = true;
    java.enable = true;
    kde.enable = true;
    networking.enable = true;

    pipewire = {
      enable = true;
      hifi = true;
    };

    plymouth.enable = true;
    podman.enable = true;
    sddm.enable = true;
    sops.enable = true;
    systemd-boot.enable = true;
    tuned.enable = true;
  };
}
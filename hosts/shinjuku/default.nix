{ ... }:

{
  imports = [
    ../../hardware/shinjuku
  ];

  networking.hostName = "shinjuku";

  modules = {
    _1password.enable = true;
    fonts.enable = true;
    kde.enable = true;
    networking.enable = true;
    pipewire.enable = true;
    plymouth.enable = true;
    podman.enable = true;
    power.enable = true;
    sddm.enable = true;
    sops.enable = true;
    systemd-boot.enable = true;
    userapps.enable = true;
  };
}
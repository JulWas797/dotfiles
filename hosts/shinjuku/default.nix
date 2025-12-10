{ ... }:

{
  imports = [
    ../../hardware/shinjuku
  ];

  networking.hostName = "shinjuku";

  modules = {
    _1password.enable = true;
    kde.enable = true;
    pipewire.enable = true;
    plymouth.enable = true;
    podman.enable = true;
    power.enable = true;
    sddm.enable = true;
    systemd-boot.enable = true;
    userapps.enable = true;
  };
}
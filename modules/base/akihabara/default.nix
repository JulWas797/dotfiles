{ lib, ... }: 

{
  imports = [
    ./cloudflared
    ./glances
    ./jellyfin
    ./jenkins
    ./maven
  ];

  # temp
  services.openssh.enable = true;

  networking = {
    firewall.enable = lib.mkForce false;

    defaultGateway = "192.168.0.1";

    useDHCP = false;

    interfaces.enp1s0 = {
      useDHCP = false;

      ipv4.addresses = [
        {
          address = "192.168.0.67";
          prefixLength = 24;
        }
      ];
    };  
  };

  sops.defaultSopsFile = lib.mkForce ../../../secrets/homelab/default.yaml;
}
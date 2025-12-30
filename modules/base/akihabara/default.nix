{ lib, ... }: 

{
  imports = [
    ./glances
  ];

  # temp
  services.openssh.enable = true;

  networking = {
    firewall.enable = lib.mkForce false;

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
}
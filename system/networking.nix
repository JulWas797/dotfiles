{ ... }:

{
  networking = {
    hostName = "nyanix";
    
    #wireless.iwd.enable = true;
    
    networkmanager = {
      enable = true;
      #wifi.backend = "iwd";
    };

    firewall.enable = false;
  };
}

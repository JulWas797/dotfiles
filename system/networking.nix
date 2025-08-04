{ config, pkgs, ... }:

{
  networking = {
	hostName = "nyanix";
	networkmanager.enable = true;
	firewall.enable = false;
  };
}

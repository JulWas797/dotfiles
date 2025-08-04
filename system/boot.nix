{ config, pkgs, ... }:

{
  boot = {
	kernelPackages = pkgs.linuxPackages_latest;

	consoleLogLevel = 3;
	initrd.verbose = false;

	plymouth = {
	  enable = true;
	  theme = "tribar";
	};

	loader = {
	  systemd-boot.enable = true;
	  efi.canTouchEfiVariables = true;
	};
  };
}

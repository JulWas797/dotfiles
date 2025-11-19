{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
    };

    kernelModules = [ ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/f0c116ae-c856-4bd1-871b-6a6c7d93e1b0";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/0A00-E6E0";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  };

  swapDevices = [
    {
      device = "/dev/disk/by-uuid/27cf6456-5c5a-4276-914e-5c8ab12d619d";
    }
  ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}

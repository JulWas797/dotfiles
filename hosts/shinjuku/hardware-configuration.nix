{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };

    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = { 
      device = "/dev/disk/by-uuid/81a4bfd0-c2a8-45a1-ba6c-45362837c0d8";
      fsType = "ext4";
    };

    "/boot" = { 
      device = "/dev/disk/by-uuid/6B86-F9DA";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  };

  swapDevices = [ 
    { 
      device = "/dev/disk/by-uuid/9c6ddbd7-c4c9-43e1-9f9b-63d92de4831c"; 
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

{ config, lib, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "ehci_pci" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };

    kernelModules = [ ];
    extraModulePackages = [ ];

    kernelParams = [ "nomodeset" ];
  };

  fileSystems = {
    "/" = { 
      device = "/dev/disk/by-uuid/e2c6a0d6-ae0f-4bf2-9c45-a1b7b249f18f";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd:1" ];
    };

    "/home" = { 
      device = "/dev/disk/by-uuid/e2c6a0d6-ae0f-4bf2-9c45-a1b7b249f18f";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd:1" ];
    };
    
    "/multimedia" = { 
      device = "/dev/disk/by-uuid/e2c6a0d6-ae0f-4bf2-9c45-a1b7b249f18f";
      fsType = "btrfs";
      options = [ "subvol=@media" "compress=zstd:1" "noatime" "autodefrag" ];
    };

    "/boot" = { 
      device = "/dev/disk/by-uuid/22C9-49C2";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
  };

  swapDevices = [ ];

  services.btrfs.autoScrub.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}

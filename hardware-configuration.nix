{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ 
    (modulesPath + "/installer/scan/not-detected.nix") 
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
      kernelModules = [ "amdgpu" ];
    };

    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ]; # For future

    extraModprobeConfig = ''
      options cfg80211 ieee80211_regdom="PL"
    '';
  };

  fileSystems = {
    "/" = { 
      device = "/dev/disk/by-uuid/33bc7119-94a2-426d-8cd9-a10d3f523d2b";
      fsType = "ext4";
    };

    "/boot" = { 
      device = "/dev/disk/by-uuid/8AAB-D1C1";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  };

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 20*1024;
  }];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  
  hardware = {
    wirelessRegulatoryDatabase = true;
    enableAllFirmware = true;
    enableRedistributableFirmware = true;

    #pulseaudio.enable = lib.mkDefault false;

    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}

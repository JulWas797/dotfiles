{ config, lib, modulesPath, pkgs, ... }:

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

    kernelParams = [ ];
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
      options = [ "subvol=@multimedia" "noatime" ];
    };

    "/boot" = { 
      device = "/dev/disk/by-uuid/22C9-49C2";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    "/mnt/hdd0" = {
      device = "/dev/disk/by-uuid/df1c570c-7b2d-442c-892a-c25146a6b6c6";
      fsType = "btrfs";
      options = [ "subvol=@hdd0" "nofail" "noatime" "compress=zstd:1" "x-systemd.automount" ];
    };

    "/mnt/movies0" = {
      device = "/dev/disk/by-uuid/df1c570c-7b2d-442c-892a-c25146a6b6c6";
      fsType = "btrfs";
      options = [ "subvol=@movies0" "nofail" "noatime" "compress=zstd:1" "x-systemd.automount" ];
    };

    "/mnt/anime0" = {
      device = "/dev/disk/by-uuid/df1c570c-7b2d-442c-892a-c25146a6b6c6";
      fsType = "btrfs";
      options = [ "subvol=@anime0" "nofail" "noatime" "compress=zstd:1" "x-systemd.automount" ];
    };

    "/mnt/series0" = {
      device = "/dev/disk/by-uuid/df1c570c-7b2d-442c-892a-c25146a6b6c6";
      fsType = "btrfs";
      options = [ "subvol=@series0" "nofail" "noatime" "compress=zstd:1" "x-systemd.automount" ];
    };

    "/mnt/downloads0" = {
      device = "/dev/disk/by-uuid/df1c570c-7b2d-442c-892a-c25146a6b6c6";
      fsType = "btrfs";
      options = [ "subvol=@downloads0" "nofail" "noatime" "compress=zstd:1" "x-systemd.automount" ];
    };

    "/mnt/hdd1" = {
      device = "/dev/disk/by-uuid/a8bb3fd2-fe2d-4834-8a09-825ecda17c6f";
      fsType = "btrfs";
      options = [ "subvol=@hdd0" "nofail" "noatime" "compress=zstd:1" "x-systemd.automount" ];
    };

    "/mnt/movies1" = {
      device = "/dev/disk/by-uuid/a8bb3fd2-fe2d-4834-8a09-825ecda17c6f";
      fsType = "btrfs";
      options = [ "subvol=@movies1" "nofail" "noatime" "compress=zstd:1" "x-systemd.automount" ];
    };

    "/mnt/anime1" = {
      device = "/dev/disk/by-uuid/a8bb3fd2-fe2d-4834-8a09-825ecda17c6f";
      fsType = "btrfs";
      options = [ "subvol=@anime1" "nofail" "noatime" "compress=zstd:1" "x-systemd.automount" ];
    };

    "/mnt/series1" = {
      device = "/dev/disk/by-uuid/a8bb3fd2-fe2d-4834-8a09-825ecda17c6f";
      fsType = "btrfs";
      options = [ "subvol=@series1" "nofail" "noatime" "compress=zstd:1" "x-systemd.automount" ];
    };
  };

  swapDevices = [ ];

  services.btrfs.autoScrub.enable = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
    cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    graphics = {
      enable = true;

      extraPackages = with pkgs; [ 
        libva
        libva-utils
      ];
    };
  };
}

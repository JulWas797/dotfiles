{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system/boot.nix
    ./system/desktop.nix
    ./system/networking.nix
    ./system/locale.nix
    ./system/audio.nix
  ];

  users.users.jwas = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };


  programs = {
    zsh.enable = true;
    git.enable = true;

    java = {
      enable = true;
      package = pkgs.jetbrains.jdk;
    };
  };

  environment.systemPackages = with pkgs; [
    jetbrains.jdk
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.krdc
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    kdePackages.yakuake
    haruna
    htop
    telegram-desktop
    tree
    undollar
    vim
    wget
    yt-dlp
  ];

  fonts.packages = with pkgs; [
    helvetica-neue-lt-std
    nerd-fonts.fira-code
  ];

  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

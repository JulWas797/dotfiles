{ pkgs, ... }:

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

    gamemode.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };

  environment.systemPackages = with pkgs; [
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.krdc
    kdePackages.isoimagewriter
    kdePackages.partitionmanager
    kdePackages.yakuake

    jetbrains.jdk

    ayugram-desktop
    haruna
    htop
    libreoffice
    nixd
    tree
    vim
    wget
    yt-dlp
  ];

  fonts.packages = with pkgs; [
    helvetica-neue-lt-std
    nerd-fonts.fira-code
  ];

  services.fstrim.enable = true;

  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;

  nix = {
    optimise.automatic = true;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}

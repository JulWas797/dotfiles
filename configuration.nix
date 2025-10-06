{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./system/boot.nix
    ./system/desktop.nix
    ./system/networking.nix
    ./system/locale.nix
    ./system/audio.nix
    ./system/tuned.nix
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

    _1password.enable = true;

    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "jwas" ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      kdePackages.ghostwriter
      kdePackages.isoimagewriter
      kdePackages.kate
      kdePackages.kcalc
      kdePackages.krdc
      kdePackages.kmail
      kdePackages.partitionmanager
      kdePackages.yakuake

      jetbrains.jdk

      ayugram-desktop
      deadbeef
      haruna
      htop
      iw
      libreoffice
      nixd
      tree
      vim
      wget
      yt-dlp
    ];  

    etc = {
      "1password/custom_allowed_browsers" = {
        text = ''
          librewolf
        '';
        mode = "0755";
      };
    };
  };

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

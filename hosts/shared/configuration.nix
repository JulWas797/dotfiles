{ pkgs, ... }:

{
  imports = [
    ./modules/boot.nix
    ./modules/desktop.nix
    ./modules/networking.nix
    ./modules/locale.nix
    ./modules/audio.nix
    ./modules/tuned.nix
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

    _1password.enable = true;

    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "jwas" ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      kdePackages.isoimagewriter
      kdePackages.kate
      kdePackages.kcalc
      kdePackages.krdc
      kdePackages.okular
      kdePackages.partitionmanager
      kdePackages.yakuake

      jetbrains.jdk

      ayugram-desktop
      deadbeef
      haruna
      htop
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

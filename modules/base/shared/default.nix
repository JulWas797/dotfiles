{ pkgs, ... }: 

{
  imports = [
    ./_1password
    ./adb
    ./fonts
    ./gaming
    ./java
    ./kde
    ./networking
    ./pipewire
    ./plymouth
    ./podman
    ./sddm
    ./sops
    ./sway
    ./systemd-boot
  ];

  users.users.jwas = {
    description = "Julian W";
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  time.timeZone = "Europe/Warsaw";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "pl_PL.UTF-8";
      LC_IDENTIFICATION = "pl_PL.UTF-8";
      LC_MEASUREMENT = "pl_PL.UTF-8";
      LC_MONETARY = "pl_PL.UTF-8";
      LC_NAME = "pl_PL.UTF-8";
      LC_NUMERIC = "pl_PL.UTF-8";
      LC_PAPER = "pl_PL.UTF-8";
      LC_TELEPHONE = "pl_PL.UTF-8";
      LC_TIME = "pl_PL.UTF-8";
    };
  };

  console.keyMap = "pl2";

  services = {
    xserver.xkb = {
      layout = "pl";
      variant = "";
    };

    fstrim.enable = true;
    libinput.touchpad.naturalScrolling = true;
    
  };
  
  programs = {
    zsh = {
      enableGlobalCompInit = false;
      enable = true;  
    };

    git.enable = true;
    nix-ld.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      htop
      sops
      tree
      vim
      wget
    ];

    sessionVariables = rec {
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = [ "${XDG_BIN_HOME}" ];
    };
  };

  networking.firewall.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.stateVersion = "25.11";
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
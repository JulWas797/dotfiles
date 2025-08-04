{ config, pkgs, ... }:

{

  imports = [
    ./user/fetch.nix
    ./user/librewolf.nix
    ./user/zsh.nix
    ./user/konsole.nix
    ./user/git.nix
    ./user/direnv.nix
  ];

  home = {
    username = "jwas";
    homeDirectory = "/home/jwas";
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}

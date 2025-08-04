{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;

    shellAliases = {
      upd = "cd ~/.dotfiles && nix flake update && sudo nixos-rebuild switch --flake .";
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";

      plugins = [
        "git"
        "colored-man-pages"
        "colorize"
      ];
    };
  };
}

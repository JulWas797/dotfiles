{ ... }:

{
  programs.zsh.shellAliases = {
    upd = "cd ~/.dotfiles && nix flake update && sudo nixos-rebuild switch --flake .#nyanix";
  };
}
{ pkgs, ... }:

{
  imports = [
    ./modules/zsh.nix
    ../shared/home.nix
  ];
}

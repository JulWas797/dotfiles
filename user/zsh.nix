{ pkgs, ... }:

let
 agnoster-nix-theme = pkgs.fetchgit {
    url = "https://gist.github.com/CollinDewey/2e6b6c5b257d2f6895603ddb160e6f1d";
    rev = "804f5d1bd9cb37c18cba252ff4eebf62dadc5c7f";
    sha256 = "sha256-iwFVyG3Np+vLJMhbW8b00mnCXSMY+f69lUGzl8rqfhU=";
  };

  zsh-customs = pkgs.stdenv.mkDerivation {
    name = "zsh-customs";

    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/themes
      cp "${agnoster-nix-theme}"/agnoster-nix.zsh-theme $out/themes/agnoster-nix.zsh-theme
    '';
  };
in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;

    shellAliases = {
      upd = "cd ~/.dotfiles && nix flake update && sudo nixos-rebuild switch --flake .";
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster-nix";

      plugins = [
        "git"
        "colored-man-pages"
        "colorize"
      ];
    
      custom = "${zsh-customs}";
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
  };

  home.file.".oh-my-zsh/custom/themes/agnoster-nix.zsh-theme".source = agnoster-nix-theme;
}

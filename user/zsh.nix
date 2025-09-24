{ pkgs, ... }:

let
 agnoster-nix-theme = pkgs.fetchgit {
    url = "https://gist.github.com/JulWas797/72373e205a998b4a9d146bbdb03b4e36";
    rev = "2ac0de1d962784c69b6233da7d7bbe134e902557";
    sha256 = "sha256-zg4o2pkKu6txSMzZ/eVtUq3+VDoxVLxBDqiOlGZy+0w=";
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
}

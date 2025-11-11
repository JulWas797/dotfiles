{ lib, config, pkgs, ... }:

let
  agnoster-nix-theme = pkgs.fetchgit {
    url = "https://gist.github.com/JulWas797/72373e205a998b4a9d146bbdb03b4e36";
    rev = "7f6be33e68db39c9327575ddd4d7be59dcf1edbb";
    sha256 = "sha256-Y9ez6Yjo6DE916m3KLuR4FPHFvl75wSUFuB3kKQtV9A=";
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
  options.modules.zsh.enable = lib.mkEnableOption "Enable the Z shell";

  config = lib.mkIf config.modules.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;

      shellAliases = {
        upd = "cd ~/.dotfiles && nix flake update && sudo nixos-rebuild switch --flake .#$(hostname)";
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
  };
}

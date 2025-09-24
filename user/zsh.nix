{ pkgs, ... }:

let
  agnoster-nix-theme = builtins.fetchurl {
    url = "https://gist.githubusercontent.com/chisui/0d12bd51a5fd8e6bb52e6e6a43d31d5e/raw/a97b74ce17c5f1befabe266ccf02a972cab2911b/agnoster-nix.zsh-theme";
    sha256 = "1m7qqrp8z0glnq81c9ldzmm0r42rgdmw8nk9hvssbjphx5khk6z7";
  };

  zsh-customs = pkgs.stdenv.mkDerivation {
    name = "zsh-customs";

    phases = [ "buildPhase" ];
    buildPhase = ''
      mkdir -p $out/themes
      cp ${agnoster-nix-theme} $out/themes/agnoster-nix.zsh-theme
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

    ohMyZsh = {
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

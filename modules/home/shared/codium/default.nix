{ lib, config, pkgs, ... }:

{
  options.modules.codium.enable = lib.mkEnableOption "Enable Codium";

  config = lib.mkIf config.modules.codium.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;

      profiles.default = {
        extensions = with pkgs.vscode-marketplace; [
          be5invis.vscode-icontheme-nomo-dark
          formulahendry.code-runner
          jnoortheen.nix-ide
          enkia.tokyo-night
          eamodio.gitlens
        ];

        userSettings = {
          "editor.cursorBlinking"= "smooth";
          "editor.cursorSmoothCaretAnimation"= "on";
          "editor.fontFamily" = "'FiraCode Nerd Font', 'monospace', monospace";
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
          "workbench.colorTheme" = "Tokyo Night";
        };
      };
    };

    home.packages = [ pkgs.nixd ];
  }; 
}
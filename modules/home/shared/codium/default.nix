{ lib, config, pkgs, ... }:

{
  options.modules.codium.enable = lib.mkEnableOption "Enable Codium";

  config = lib.mkIf config.modules.codium.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;

      profiles.default = {
        extensions = with pkgs.vscode-marketplace; [
          chadalen.vscode-jetbrains-icon-theme
          formulahendry.code-runner
          jnoortheen.nix-ide
        ];

        userSettings = {
          "editor.cursorBlinking"= "smooth";
          "editor.cursorSmoothCaretAnimation"= "on";
          "editor.fontFamily" = "'FiraCode Nerd Font', 'monospace', monospace";
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nixd";
        };
      };
    };
  }; 
}
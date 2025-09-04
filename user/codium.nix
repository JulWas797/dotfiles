{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        anan.jetbrains-darcula-theme
        chadalen.vscode-jetbrains-icon-theme
        formulahendry.code-runner
        jnoortheen.nix-ide
        mkhl.direnv
        ms-ceintl.vscode-language-pack-pl
        nimlang.nimlang
      ];

      userSettings = {
        "editor.cursorBlinking"= "smooth";
        "editor.cursorSmoothCaretAnimation"= "on";
        "editor.colorTheme"= "sweet-vscode";
        "editor.fontFamily" = "'FiraCode Nerd Font', 'monospace', monospace";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
    };
  };
}

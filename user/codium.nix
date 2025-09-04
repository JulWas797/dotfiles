{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        formulahendry.code-runner
        jnoortheen.nix-ide
        mkhl.direnv
        ms-ceintl.vscode-language-pack-pl
        nimlang.nimlang
        s3gf4ult.monokai-vibrant
      ];

      userSettings = {
        "editor.cursorBlinking"= "smooth";
        "editor.cursorSmoothCaretAnimation"= "on";
        "editor.colorTheme"= "Monokai Vibrant";
        "editor.fontFamily" = "'FiraCode Nerd Font', 'monospace', monospace";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
      };
    };
  };
}

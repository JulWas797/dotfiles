{ ... }: 

{
  programs.ghostwriter = {
    enable = true;

    preview.codeFont = {
      family = "FiraCode Nerd Font";
      pointSize = 12;
    };
  };
}
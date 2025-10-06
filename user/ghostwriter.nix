{ ... }: 

{
  programs.ghostwriter = {
    enable = true;

    preview.codeFont = {
      name = "FiraCode Nerd Font";
      size = 12;
    };
  };
}
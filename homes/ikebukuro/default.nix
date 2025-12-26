{ ... }:

{
  imports = [
    ../../modules/home
  ];

  modules = {
    codium.enable = true;
    direnv.enable = true;
    foot.enable = true;
    fetch.enable = true;
    librewolf.enable = true;
    sops.enable = true;
    sway.enable = true;
    tex.enable = true;
    userapps.enable = true;
    zsh.enable = true;
    waybar.enable = true;
  };
}

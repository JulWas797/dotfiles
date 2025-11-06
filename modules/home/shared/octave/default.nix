{ lib, config, pkgs, ... }:

{
  options.modules.octave.enable = lib.mkEnableOption "GNU Octave (M*tlab clone)";

  config = lib.mkIf config.modules.octave.enable {
    home.packages = with pkgs; [
      octave
    ];
  };
}
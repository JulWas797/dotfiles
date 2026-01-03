{ lib, config, pkgs, ... }:

{
  options.modules.ssh.enable = lib.mkEnableOption "ssh";

  config = lib.mkIf config.modules.ssh.enable {
    programs.ssh.startAgent = true;
  };
}
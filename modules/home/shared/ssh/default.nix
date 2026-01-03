{ lib, config, pkgs,  ... }:

{
  options.modules.ssh.enable = lib.mkEnableOption "ssh";

  config = lib.mkIf config.modules.ssh.enable {
    programs.ssh = {
      enable = true;
      
      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/id_github";
          identitiesOnly = true;
          addKeysToAgent = "yes";
        };

        "gitssh.jwas.pl" = {
          hostname = "gitssh.jwas.pl";
          user = "git";
          identityFile = "~/.ssh/id_forgejo";
          identitiesOnly = true;
          addKeysToAgent = "yes";
          proxyCommand = "${pkgs.cloudflared}/bin/cloudflared access ssh --hostname %h";
        };
      };
    };

    home.packages = [ pkgs.cloudflared ];
  };
}
{ lib, config, osConfig, ... }:

{
  options.modules.matlab.enable = lib.mkEnableOption "Matlab";

  config = lib.mkIf config.modules.matlab.enable {
    programs.distrobox = {
      enable = true;

      containers.matlab = {
        entry = false;
        exported_bin = "/opt/matlab/R2025b/bin/matlab";
        hostname = "${osConfig.networking.hostName}";
        image = "mathworks/matlab:r2025b";
      };     
    };

    xdg.desktopEntries.matlab = {
      name = "MATLAB R2025b";
      genericName = "Scientific Computing Environment";
      exec = ''sh -c "${config.home.homeDirectory}/.local/bin/matlab -desktop %U ; distrobox stop matlab -Y"'';
      icon = "${./resources/icon.png}"; 
      terminal = false;
      categories = [ "Development" ];
      mimeType = [ "text/x-matlab" "application/x-matlab-data" ];
    };
  };
}
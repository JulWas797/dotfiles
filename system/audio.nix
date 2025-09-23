{ ... }:

{
  services = {
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      extraConfig.pipewire.dac = { 
        "context.properties" = {
          "default.clock.allowed-rates" = [ 44100 48000 192000 ]; 
          "default.clock.quantum" = 32;
          "default.clock.min-quantum" = 32;
          "default.clock.max-quantum" = 32;
        }; 
      };
    };
  };

  security.rtkit.enable = true;
}

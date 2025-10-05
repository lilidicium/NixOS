{ config, pkgs, ... }:{

  musnix = {
    enable = true;
    kernel.realtime = true;    
  };

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;
  };

  services.jack = {
    jackd.enable = false;
    # support ALSA only programs via ALSA JACK PCM plugin
    alsa.enable = false;
    # support ALSA only programs via loopback device (supports programs like Steam)
    loopback = {
      enable = false;
    };
  };

  users.extraUsers.maggie.extraGroups = [ "audio" ];

}

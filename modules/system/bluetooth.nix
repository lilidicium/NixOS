{ config, ... }: {

  services.blueman.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = false; # shows battery levels of devices
        FastConnectable = true; # faster connections, worse battery life
      };
      Policy = {
        AutoEnable = true; # immediately enables bluetooth adapters when found
      };
    };
  };

}

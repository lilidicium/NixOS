{ config, pkgs, ... }:{

  wayland.windowManager.hyprland = {
    extraConfig = ''

      device { 
        name = razer-razer-basilisk-v3-pro-mouse
        sensitivity = -0.7
      }

      device { 
        name = razer-razer-basilisk-v3-pro-1
        sensitivity = -0.7
      }

      device { 
        name = tpps/2-elan-trackpoint
        sensitivity = -0.7
      }
      
    '';
  };

}
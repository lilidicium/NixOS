{ config, pkgs, ... }:{

  wayland.windowManager.hyprland = {
    extraConfig = ''
      monitor = eDP-1, preferred, auto, 1
      monitor = HDMI-A-1, 2560x1440@144, auto, 1
    '';
  };

}
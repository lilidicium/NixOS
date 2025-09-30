{ config, pkgs, ... }:{

  wayland.windowManager.hyprland.settings = {
    general.layout = "dwindle";
    dwindle = {
      pseudotile = false;
      preserve_split = false;
      force_split = 2;
    };
    master = {
      new_status = "master";
      new_on_top = 1;
      mfact = 0.5;
    };
  };
  
}
{ config, pkgs, ... }:{

  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 0;
      resize_on_border = false;
    };
    decoration = {
      rounding = 18;
      blur = {
        enabled = true;
        size = 5;
        passes = 3;
        ignore_opacity = true;
        new_optimizations = true;
      };
      shadow = {
        enabled = false;
        range = 4;
        render_power = 3;
      };
    };
  };
}

{ config, pkgs, ... }:{

  xresources.properties = {
    "Xcursor.size" = 36;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    x11.defaultCursor = "BreezeX-RosePine-Linux";
    size = 36;
  };

  wayland.windowManager.hyprland.settings = {
    general = {
    }; 
    cursor = {
      sync_gsettings_theme = true;
      no_hardware_cursors = 2; # 1 for off
      enable_hyprcursor = true;
      warp_on_change_workspace = 2;
      no_warps = true;
      winactive_timeout = 1; # seconds
    };
  };

}
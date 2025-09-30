{ config, pkgs, ... }:{

  wayland.windowManager.hyprland.settings = {
      animation = [
      "workspaces, 1, 3, default, slidefadevert 20%"
      "windows, 1, 3, default, popin"
      "windowsMove, 1, 3, default, slide"
    ];
  };
}
{ config, pkgs, ... }:{

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "caelestia shell"
      "hyprctl setcursor rose-pine-hyprcursor 36"
      "pypr"
    ];
  };

}

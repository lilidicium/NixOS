{ config, pkgs, ... }:{

    xresources.properties = {
    "Xft.dpi" = 96;
  };

  wayland.windowManager.hyprland = {
    xwayland.enable = true;
    settings = {
      render = {
        explicit_sync = 1; # (1/2) (off/on)
        explicit_sync_kms = 1;
        direct_scanout = 0;
      };
      misc = {
        vfr = true; # variable refresh rate
        vrr = 2;
      };
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };

}
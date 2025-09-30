{ config, pkgs, ... }:{

#  home.packages = with pkgs; [
#    swww
#  ];

#  systemd.user.targets.hyprland-session.Unit.Wants = [
#    "xdg-desktop-autostart.target"
#  ];

  # TODO: wallpaper git sync

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
  };
}

{ config, ... }:{

environment.variables = {
  MOZ_ENABLED_WAYLAND = 1; # tells firefox to use wayland
  NIXOS_OZONE_WL = 1; # tells chromium to use wayland
  EDITOR = "micro";
  HYPRSHOT_DIR = "/home/maggie/media/images/screenshots"; # these screenshot directories don't fucking work for some reason.
  XDG_PICTURES_DIR  = "/home/maggie/media/images/screenshots";
};

}
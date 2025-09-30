{ config, ... }: {

  environment.variables = {
    MOZ_ENABLED_WAYLAND = 1; # tells firefox to use wayland
    NIXOS_OZONE_WL = 1; # tells chromium to use wayland
    EDITOR = "micro";
  };

}

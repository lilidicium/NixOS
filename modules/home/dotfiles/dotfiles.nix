{ config, pkgs, ... }: {

  home.file = {
    ".config/hypr/pyprland.toml" = {
      source = ./pyprland/pyprland.toml;
    };
  };

}

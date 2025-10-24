{ config, pkgs, ... }: {

  home.file = {
    ".config/hypr/pyprland.toml" = {
      source = ./pyprland/pyprland.toml;
    };
    ".config/caelestia/shell.json" = {
    source = ./caelestia/caelestia.json;
    };
  };
}

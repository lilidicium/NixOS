{ config, pkgs, lib, ... }: {

  home.file = {
    ".config/hypr/pyprland.toml" = {
      source = ./pyprland/pyprland.toml;
    };
    ".config/caelestia/shell.json" = {
    source = ./caelestia/caelestia.json;
    };
    ".config/noctalia/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink ./noctalia/settings.json;
    };
  };

}

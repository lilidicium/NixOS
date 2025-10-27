{ config, pkgs, lib, ... }: {

  home.file = {
    ".config/noctalia/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink ./noctalia/settings.json;
    };
  };

}

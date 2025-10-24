{ config, pkgs, ... }:{

  programs.niri.enable = true;

  home.file.".config/niri/niri.kdl" = { source = ./niri.kdl };

}

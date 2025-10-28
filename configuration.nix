{ config, pkgs, inputs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./modules/system
  ];

  system.stateVersion = "25.05"; # no need to change this :3
}

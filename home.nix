{ config, pkgs, lib, inputs, specialArgs, ... }: {

  imports = [
    ./modules/home
  ];

  home.stateVersion = "25.05"; # no need to change this :3

}

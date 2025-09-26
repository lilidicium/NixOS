{ config, pkgs, lib, inputs, specialArgs, ... }:

{

	imports = [
		./modules/home/default.nix
	];
	
#	wayland.windowManager.hyprland = {
#		enable = true;
#	};

	home.stateVersion = "25.05"; # no need to change this :3
}
{ host, ... }: let

in {
	imports = 
	[
		./hyprland.nix
		./system.nix
	];
}

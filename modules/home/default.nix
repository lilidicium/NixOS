{ host, ... }: let

in {
	imports = 
	[
		./hyprland.nix
		./stylix.nix
	];
}

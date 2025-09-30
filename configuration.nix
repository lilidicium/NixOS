{ config, pkgs, inputs, ... }:{

imports = [
	./hardware-configuration.nix
	./modules/system
];

# this is seemingly hardcoded to only work when it's in configuration.nix specifically. sigh
stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

system.stateVersion = "25.05"; # no need to change this :3

}
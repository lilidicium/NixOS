{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
	
		# terminal tools
		man
		tldr
		tree

		# terminal apps
		btop
		fastfetch
		iwd

		# graphical apps
		vesktop
		nemo
		pavucontrol
		libreoffice
		vscode

		# launcher
		nwg-launchers

		# usb utils
		ventoy-full-gtk
		woeusb-ng
		ntfs3g

		# hyprland ecosystem
		pyprland
		hyprcursor
		hyprshot

		# misc
		renpy

		# shell
		inputs.caelestia-shell.packages."${pkgs.system}".default
		inputs.caelestia-cli.packages."${pkgs.system}".default

	];
}
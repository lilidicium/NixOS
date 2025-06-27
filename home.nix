{ config, pkgs, inputs, ... }:
#{config, pkgs, ... }:

{
	home.username = "maggie";
	home.homeDirectory = "/home/maggie";

	xresources.properties = {
		"Xcursor.size" = 24;
		"Xft.dpi" = 172;
	};
	
	imports = [
		./desktop/default.nix
		inputs.sherlock.homeModules.default
		inputs.zen-browser.homeModules.twilight
#		inputs.stylix.homeManagerModules.stylix
	];
	
	home.packages = with pkgs; [

		fastfetch

		man
		tldr
		tree
		statix
		glow # terminal markdown viewer
		btop
		nh

		vesktop

		hyprcursor

		nerd-fonts.fantasque-sans-mono
		rose-pine-hyprcursor
		rose-pine-cursor
		base16-schemes
	
	];

	programs = {

		git = {
			enable = true;
			userName = "lilidicium";
			userEmail = "lilidicium@gmail.com";
		};

		starship = {
			enable = true;
			settings = {
				preset = "pastel-powerline";
			};
		};

		alacritty = {
			enable = true;
			settings = {
				env.TERM = "xterm-256color";
				font = {
					normal = {
						family = "FantasqueSansM Nerd Font";
						style = "Regular";
					};
					size = 12;
				};
				scrolling.multiplier = 5;
				selection.save_to_clipboard = true;
				};
		};

#		sherlock = {
#			enable = true;
#			settings = {
#			
#				aliases = {
#					vesktop = {name = "Discord";};
#				};
#					
#				config = {
#					debug = {try_suppress_warnings = true;};
#				};
#					
#				style = null;
#			};
#		};

		zen-browser = {
			enable = true;
		};

		bash = {
			enable = true;
			enableCompletion = true;
			bashrcExtra = ''
				export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
				fastfetch
			'';
			shellAliases = {
				pls = "sudo";
				please = "sudo $(history -p !!)";
				rebuild = "git stage . && sudo nixos-rebuild switch";
				test = "git stage . && sudo nixos-rebuild test";
			};
		};
	};

	stylix = {
		enable = true;
		base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
	};

	home.pointerCursor = {
		gtk.enable = true;
		x11.enable = true;
		package = pkgs.rose-pine-cursor;
		name = "BreezeX-RosePine-Linux";
		x11.defaultCursor  = "BreezeX-RosePine-Linux";	
		size = 24;
	};	

	wayland.windowManager.hyprland = {
		enable = true;
	};
	
	# This value lets home Manager know
	# what version it started on so that
	# it doesn't break your config when
	# it introduces backward-incompatible
	# changes. No need to change this.
	home.stateVersion = "25.05";
}

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
		inputs.zen-browser.packages.${pkgs.system}.twilight
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
	
	];

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

	programs.git = {
		enable = true;
		userName = "lilidicium";
		userEmail = "lilidicium@gmail.com";
	};

	programs.starship = {
		enable = true;
		settings = {
			add_newline = false;
			aws.disabled = true;
			gcloud.disabled = true;
			line_break.disabled = true;
		};
	};

	catppuccin = {
		enable = true;
		flavor = "macchiato";
		accent = "mauve";
	};
	
	programs.alacritty = {
		enable = true;
		settings = {
			env.TERM = "xterm-256color";
			font = {
				size = 12;
			};
			scrolling.multiplier = 5;
			selection.save_to_clipboard = true;
		};
	};

	programs.sherlock = {
		enable = true;
		settings = {
		
			aliases = {
				vesktop = {name = "Discord";};
			};
			
			config = {
				debug = {try_suppress_warnings = true;};
			};
			
			style = null;
		};
	};
	
	programs.zen-browser = {
		enable = true;
	};
	
	programs.bash = {
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

	# This value lets home Manager know
	# what version it started on so that
	# it doesn't break your config when
	# it introduces backward-incompatible
	# changes. No need to change this.
	home.stateVersion = "25.05";
}

{ config, pkgs, lib, inputs, specialArgs, ... }:

{

	imports = [
		./modules/home/default.nix
		inputs.zen-browser.homeModules.default
	];

          
#		┏┓┏┏╋┏┓┏┳┓
#		┛┗┫┛┗┗ ┛┗┗
#		  ┛  

	home.username = "maggie";
	home.homeDirectory = "/home/maggie";
	
	wayland.windowManager.hyprland = {
		enable = true;
	};

	xresources.properties = {
		"Xcursor.size" = 36;
		"Xft.dpi" = 96;
	};
	
	home.pointerCursor = {
		gtk.enable = true;
		x11.enable = true;
		package = pkgs.rose-pine-cursor;
		name = "BreezeX-RosePine-Linux";
		x11.defaultCursor  = "BreezeX-RosePine-Linux";	
		size = 36;
	};	


#		      ┓        
#		┏┓┏┓┏ ┃┏┏┓┏┓┏┓┏
#		┣┛┗┻┗ ┛┗┗┻┗┫┗ ┛
#		┛          ┛  

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

		# ===== dependencies
		# brightnessctl
		# playerctl		
		# cava
		# networkmanager
		# fish
		# aubio
		# grim
		# bluez
		# swappy
		# power-profiles-daemon
		# wl-clipboard-rs
		# playerctl
		# ddcutil

	];

#		┏┓┏┓┏┓┏┓┏┓┏┓┏┳┓┏
#		┣┛┛ ┗┛┗┫┛ ┗┻┛┗┗┛
#		┛      ┛     

	programs = {

		git = {
			enable = true;
			userName = "lilidicium";
			userEmail = "lilidicium@gmail.com";
		};

		starship = {
			enable = true;
			settings = {
			
			};
		};

		vscode = {
			enable = true;
		};

		alacritty = {
			enable = true;
			settings = {
				env.TERM = "xterm-256color";
				font = { size = lib.mkForce 18; };
				scrolling.multiplier = 5;
				selection.save_to_clipboard = true;
				window.padding = { x=20; y=20; };
#				window.opacity = { 0.8; };
			};
		};

		zen-browser = {
			enable = true;
			profiles = {
				default = {
					id = 0;
					name = "default";
					isDefault = true;
					settings = {
						"layout.css.devPixelsPerPx" = "1.3";
						"browser.startup.homepage" = "https://startpage.com";
						"browser.search.defaultenginename" = "Startpage";
						"browser.search.order.1" = "Startpage";
					};
					search = {
						force = true;
						default = "Startpage";
						order = [ "Startpage" "Google "];
						engines = {
				            "Startpage" = {
				            	urls = [{ template = "https://www.startpage.com/sp/search?query={searchTerms}"; }];
				           	};
				        };
				    };
				};
			};
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
				rebuild = "git stage . && sudo nixos-rebuild switch --impure";
				test = "git stage . && sudo nixos-rebuild test";
			};
		};
	};
			
	home.stateVersion = "25.05"; # no need to change this :3
}

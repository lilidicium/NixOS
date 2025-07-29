{ config, pkgs, lib, inputs, specialArgs, ... }:

{

	imports = [
		./desktop/default.nix
		inputs.sherlock.homeModules.default
		inputs.zen-browser.homeModules.twilight
		inputs.textfox.homeManagerModules.default
#		inputs.caelestia-shell.packages."${pkgs.system}".default
#		inputs.caelestia-cli.packages."${pkgs.system}".default
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
		iwd

		# terminal apps
		glow # terminal markdown viewer
		btop
		fastfetch

		vesktop

		hyprcursor
		hyprshot

		# dependencies
		brightnessctl
		playerctl		
		cava
		networkmanager
		fish
		aubio
		grim
		bluez
		swappy
		power-profiles-daemon
		wl-clipboard-rs
		playerctl
		ddcutil
		swaynotificationcenter
		light
		libqalculate

		material-symbols
		nerd-fonts.jetbrains-mono
		
		pavucontrol

		modrinth-app

		inputs.caelestia-shell.packages."${pkgs.system}".default
		inputs.caelestia-cli.packages."${pkgs.system}".default
	
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
			enable = false;
		};
		
		firefox = {
			enable = true;
			
			profiles = {
				default = {
					id = 0;
					name = "default";
					isDefault = true;
					settings = {
						"browser.startup.homepage" = "https://startpage.com";
						"browser.search.defaultenginename" = "Startpage";
						"browser.search.order.1" = "Startpage";
						"extensions.autoDisableScopes" = 0;
					};
#					extensions = with pkgs.nur.repos.rycee.firefox-addons; [
#						ublock-origin	
#					];
#					extensions = {
#						packages  = with pkgs.nur.repos.rycee.firefox-addons; [
#
#							ublock-origin
#							
#						];
#					};
					search = {
						force = true;
						default = "Startpage";
						order = [ "Startpage" "Google "];
						engines = {
						
							"Nix Packages" = {
								urls = [{
									template = "https://search.nixos.org/packages";
									params = [
										{ name = "type"; value = "packages"; }
										{ name = "query"; value = "{searchTerms}"; }
									];
								}];
								icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
								definedAliases = [ "@np" ];
							};
							
							"NixOS Wiki" = {
							    urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
					            icon = "https://nixos.wiki/favicon.png";
					            updateInterval = 24 * 60 * 60 * 1000; # every day
				                definedAliases = [ "@nw" ];
				            };

				            "Startpage" = {
				            	urls = [{ template = "https://www.startpage.com/sp/search?query={searchTerms}"; }];
				          #  	iconUpdateURL = "https://startpage.com/favicon.png"
				          		definedAliases = [ "@sp" ];
				            };

							"bing".metaData.hidden = true;
							"google".metaData.alias = [ "@g" ];
						};
					};
				};
			};
		};

#		caelestia-shell = {
#			enable = true;
#		};
			
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


#		    ┓  
#		┏╋┓┏┃┏┓
#		┛┗┗┫┗┗ 
#		   ┛   

	stylix = {
		enable = true;
			fonts = {
			    serif = {
			      package = pkgs.paratype-pt-serif;
		    	  name = "PT Serif"; };
		 	  sansSerif = {
		 	     package = pkgs.inter;
		 	     name = "Inter"; };
		 	   monospace = {
		 	     package = pkgs.nerd-fonts.fantasque-sans-mono;
		 	     name = "FantasqueSansM Nerd Font"; };
		 	   emoji = {
		 	     package = pkgs.noto-fonts-emoji;
		 	     name = "Noto Color Emoji"; };
			};
			
			targets.firefox.profileNames = [ "default" ];
	};

	textfox = {
				enable = true;
				profile = "default";
	};

	home.stateVersion = "25.05"; # no need to change this :3
}

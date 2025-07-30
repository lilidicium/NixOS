{ config, pkgs, inputs, ... }:

{
	imports = [
  		./hardware-configuration.nix
    ];

#		┏┓┏┏╋┏┓┏┳┓
#		┛┗┫┛┗┗ ┛┗┗
#		  ┛       
	
	# Configure keymap in X11
#	services.xserver.xkb = {
 #   	layout = "us";
#	   	variant = "";
#	};

  	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";


#		┓┏ ┏┏┓┏┓
#		┗┻ ┛┗ ┛ 

	users.users.maggie = {
    	isNormalUser = true;
    	description = "Maggie";
    	extraGroups = [ "networkmanager" "wheel" ];
    	packages = with pkgs; [];
  	};

home-manager.backupFileExtension = "backup";


#  		      ┓        
#		┏┓┏┓┏ ┃┏┏┓┏┓┏┓┏
#		┣┛┗┻┗ ┛┗┗┻┗┫┗ ┛
#		┛          ┛ 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  environment.systemPackages = with pkgs; [
  
    	git
    	wget
    	brightnessctl
    	playerctl
    
    	micro

    	hyprnome

   	  # inputs.zen-browser.packages."${system}".specific
    
  	];

  	programs = {
  	
  		hyprland = {
  			enable = true;
  		};

  		steam = {
  			enable = true;
  		};

  		appimage = {
  			enable = true;
  			binfmt = true;
  		};
  		
  	};

  	console = {
  		earlySetup = true;
 # 		font = "${pkgs.nerd-fonts.fantasque-sans-mono}/share/fonts/truetype/NerdFonts/FantasqueSansM/FantasqueSansMNerdFont-Regular";
 # 		packages = with pkgs; [nerd-fonts.fantasque-sans-mono];
  	};

  system.stateVersion = "25.05"; # no need to change this :3

}

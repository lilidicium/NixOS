{ config, pkgs, inputs, ... }:

{
	imports = [
  		./hardware-configuration.nix
    ];

#		┓      ┓     ┓    
#		┣┓┏┓┏┓╋┃┏┓┏┓┏┫┏┓┏┓
#		┗┛┗┛┗┛┗┗┗┛┗┻┗┻┗ ┛ 

	boot.loader = {
  		systemd-boot.enable = true;
  		efi.canTouchEfiVariables = true;
	};
  
	boot.kernelParams = [ "mem_sleep_default=deep" ];

	systemd.sleep.extraConfig = ''
		HibernateDelaySec = 30m
  		SuspendState=mem
 	 '';


#		┏┓┏┏╋┏┓┏┳┓
#		┛┗┫┛┗┗ ┛┗┗
#		  ┛       

	environment.variables = {
		MOZ_ENABLED_WAYLAND = 1;
		NIXOS_OZONE_WL = 1;
		EDITOR = "micro";
		HYPRSHOT_DIR = "/home/maggie/media/images/screenshots";
		XDG_PICTURES_DIR  = "/home/maggie/media/images/screenshots";
	};

	networking = {
  		hostName = "nixos";
  		wireless.iwd.enable = true;
 	 	networkmanager = {
 	 		enable = true;
  			wifi.backend = "iwd";
 	 	};
 	 };

 	time.timeZone = "America/New_York";

	i18n = {
		defaultLocale = "en_US.UTF-8";
		extraLocaleSettings = {
			LC_ADDRESS = "en_US.UTF-8";
			LC_IDENTIFICATION = "en_US.UTF-8";
			LC_MEASUREMENT = "en_US.UTF-8";
			LC_MONETARY = "en_US.UTF-8";
			LC_NAME = "en_US.UTF-8";
			LC_NUMERIC = "en_US.UTF-8";
			LC_PAPER = "en_US.UTF-8";
			LC_TELEPHONE = "en_US.UTF-8";
			LC_TIME = "en_US.UTF-8";
		};
	};
	
	# Configure keymap in X11
	services.xserver.xkb = {
    	layout = "us";
	   	variant = "";
	};
	
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	# enable NUR
	nixpkgs.config.packageOverrides = pkgs: {
	    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/main.tar.gz") {
	      inherit pkgs;
	    };
	};

  	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";


#		┓┏ ┏┏┓┏┓
#		┗┻ ┛┗ ┛ 

	users.users.maggie = {
    	isNormalUser = true;
    	description = "Maggie";
    	extraGroups = [ "networkmanager" "wheel" ];
    	packages = with pkgs; [];
  	};


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

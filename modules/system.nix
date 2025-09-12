{ config, pkgs, inputs, ... }:

#		┏┓┏┏╋┏┓┏┳┓
#		┛┗┫┛┗┗ ┛┗┗
#		  ┛  
{
	environment.variables = {
		MOZ_ENABLED_WAYLAND = 1;
		NIXOS_OZONE_WL = 1;
		EDITOR = "micro";
		HYPRSHOT_DIR = "/home/maggie/media/images/screenshots";
		XDG_PICTURES_DIR  = "/home/maggie/media/images/screenshots";
	};

	services = {
		blueman.enable = true;
		};

	networking = {
  		hostName = "nixos";
  		wireless.iwd.enable = true;
 	 	networkmanager = {
 	 		enable = true;
  			wifi.backend = "iwd";
 	 	};
 	 };

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

	time.timeZone = "America/New_York";
	nixpkgs.config.allowUnfree = true;

	hardware.bluetooth = {
	  enable = true;
	  powerOnBoot = true;
	  settings = {
	    General = {
	      # Shows battery charge of connected devices on supported
	      # Bluetooth adapters. Defaults to 'false'.
	      Experimental = true;
	      # When enabled other devices can connect faster to us, however
	      # the tradeoff is increased power consumption. Defaults to
	      # 'false'.
	      FastConnectable = true;
	    };
	    Policy = {
	      # Enable all controllers when they are found. This includes
	      # adapters present on start as well as adapters that are plugged
	      # in later on. Defaults to 'true'.
	      AutoEnable = true;
	    };
	  };
	};


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
}

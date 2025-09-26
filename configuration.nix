{ config, pkgs, inputs, ... }:

{
	imports = [
  		./hardware-configuration.nix
			./modules/system/default.nix
    ];

#		┏┓┏┏╋┏┓┏┳┓
#		┛┗┫┛┗┗ ┛┗┗
#		  ┛       


  	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

    swapDevices = [
    {
        device = "/var/lib/swapfile";
        size = 16 * 1024; # 32GB in MB
      }
    ];

    
      # Define time delay for hibernation
      systemd.sleep.extraConfig = ''
        HibernateDelaySec=30m
        SuspendState=mem
      '';

services.devmon.enable = true;
services.gvfs.enable = true; 
services.udisks2.enable = true;


    boot.kernelParams = ["resume_offset=32768" "mem_sleep_default=deep"];
    
    boot.resumeDevice = "/dev/disk/by-uuid/a350e453-27b3-4103-9700-79c125cbbe61";
    
    powerManagement.enable = true;

  services.power-profiles-daemon.enable = true;
  # Suspend first then hibernate when closing the lid
  services.logind.lidSwitch = "suspend-then-hibernate";
  # Hibernate on power button pressed
  services.logind.powerKey = "hibernate";
  services.logind.powerKeyLongPress = "poweroff";


#		┓┏ ┏┏┓┏┓
#		┗┻ ┛┗ ┛ 

	users.users.maggie = {
    	isNormalUser = true;
    	description = "Maggie";
    	extraGroups = [ "networkmanager" "wheel" ];
    	packages = with pkgs; [];
  	};

home-manager.backupFileExtension = "backup";

nixpkgs.config.permittedInsecurePackages = [
                "ventoy-gtk3-1.1.05"
              ];


#  		      ┓        
#		┏┓┏┓┏ ┃┏┏┓┏┓┏┓┏
#		┣┛┗┻┗ ┛┗┗┻┗┫┗ ┛
#		┛          ┛ 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;
  
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

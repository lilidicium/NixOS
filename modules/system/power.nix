{ config, ... }: {

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16 * 1024; # 32GB in MB
  }];
  systemd.sleep.extraConfig = '' 	
	HibernateDelaySec=30m
	SuspendState=mem
''; # Define time delay for hibernation

  # Suspend first then hibernate when closing the lid
  services.logind.lidSwitch = "suspend-then-hibernate";
  # Hibernate on power button pressed
  services.logind.powerKey = "hibernate";
  services.logind.powerKeyLongPress = "poweroff";

  boot.kernelParams = [ "resume_offset=32768" "mem_sleep_default=deep" ];
  boot.resumeDevice = "/dev/disk/by-uuid/a350e453-27b3-4103-9700-79c125cbbe61";
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;

}

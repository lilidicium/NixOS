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
  
  boot.initrd.availableKernelModules = [ "nvme" "ehci_pci" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" "thinkpad_acpi" ];
  boot.initrd.kernelModules = [ "acpi_call" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
  boot.kernelParams = [ "resume_offset=32768" "mem_sleep_default=deep" ];
  boot.resumeDevice = "/dev/disk/by-uuid/a350e453-27b3-4103-9700-79c125cbbe61";
  
  powerManagement.enable = true;
  services.tlp.enable = true;
  services.upower.enable = true;
}

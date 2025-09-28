{ config, ... }:{

users.users.maggie = {
  isNormalUser = true;
  description = "Maggie";
  extraGroups = [ "networkmanager" "wheel" ];
};

}
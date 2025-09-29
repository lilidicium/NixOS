{ config, pkgs, ... }:{
  
nixpkgs.config.allowUnfree = true;
environment.systemPackages = with pkgs; [
  git
  wget
  micro

  greetd.tuigreet
  
  hyprnome # wouldn't work in home.nix for some reason
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

nixpkgs.config.permittedInsecurePackages = [
  "ventoy-gtk3-1.1.05"
];

}
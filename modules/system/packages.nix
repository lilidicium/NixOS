{ config, pkgs, nixpkgs, inputs, ... }: {

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
      # package = pkgs.steam-millennium;
    };

    appimage = {
      enable = true;
      binfmt = true;
    };

  };

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-gtk3-1.1.05"
  ];

  nixpkgs.overlays = [
    inputs.millennium.overlays.default
  ];

}

{ config, pkgs, inputs, ... }: {

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    git
    wget

    greetd.tuigreet

    inputs.noctalia.packages.${system}.default

    hyprnome # wouldn't work in home.nix for some reason
  ];

  programs = {

    niri.enable = true;

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

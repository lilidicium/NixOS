{ config, pkgs, inputs, ... }: {

  # This file is for installing packages and enabling programs.

  # If you have a program that's enabled via home-manager
  # but doesn't require its own dedicated module.nix file,
  # you can enable it here.

  home.packages = with pkgs; [

    # terminal tools
    man
    tldr
    tree

    # terminal apps
    btop
    fastfetch
    iwd

    # graphical apps
    vesktop
    kdePackages.dolphin
    pavucontrol
    libreoffice
    obsidian
    godot

    # launchers
    sysmenu

    # usb utils
    ventoy-full-gtk
    woeusb-ng
    ntfs3g

    # hyprland ecosystem
    pyprland
    hyprcursor
    hyprshot

    # misc
    renpy
    brightnessctl
    playerctl

    # shell
    inputs.caelestia-shell.packages."${pkgs.system}".default
    inputs.caelestia-cli.packages."${pkgs.system}".default

  ];

  programs = {

    git = {
      enable = true;
      userName = "lilidicium";
      userEmail = "lilidicium@gmail.com";
    };

    starship = {
      enable = true;
      settings = { };
    };
  };

}

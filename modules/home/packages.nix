{ config, pkgs, inputs, ... }: {

  # This file is for installing packages and enabling programs.

  # If you have a program that's enabled via home-manager
  # but doesn't require its own dedicated module.nix file,
  # you can enable it here.

  home.packages = with pkgs; [

    # terminal tools
    man
    tree

    # terminal apps
    btop
    fastfetch
    iwd

    # compilers
    rustup
    ghc
    gcc
    python3

    # graphical apps
    vesktop
    kdePackages.dolphin
    pavucontrol
    libreoffice
    obsidian
    godot
    renoise
    obs-studio
    emacs
    wezterm

    # launchers
    sysmenu
    fuzzel

    # usb utils
    ventoy-full-gtk
    woeusb-ng
    ntfs3g

    # hyprland ecosystem
    pyprland
    hyprcursor
    hyprshot
    hyprpicker

    # misc
    brightnessctl
    playerctl
    wl-clipboard
    xwayland-satellite
    preload

    # shell
    inputs.caelestia-shell.packages."${pkgs.system}".default
    inputs.caelestia-cli.packages."${pkgs.system}".default

    # manix
      renpy
      kmonad

];

  programs = {

    git = {
      enable = true;
      userName = "lilidicium";
      userEmail = "lilidicium@gmail.com";
    };

    starship = {
      enable = false;
      settings = { };
    };

    doom-emacs.enable = true;
  };

}

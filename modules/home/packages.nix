{ config, pkgs, inputs, ... }: {

  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  # This file is for installing packages and enabling programs.

  # If you have a program that's enabled via home-manager
  # but doesn't require its own dedicated module.nix file,
  # you can enable it here.

  home.packages = with pkgs; [

    # terminal tools
    man
    tree
    tldr
    fd

    # terminal apps
    btop
    iwd
    nerdfetch

    # compilers
    rustup
    ghc
    gcc
    python3

    # graphical apps
    vesktop
    kdePackages.dolphin
    pavucontrol
    obsidian
    godot
    ghostty
    appflowy
    notion-app-enhanced

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
    hyprpicker

    # misc
    brightnessctl
    playerctl
    wl-clipboard
    xwayland-satellite
    pywalfox-native
    ripgrep

    # shell
    inputs.caelestia-shell.packages."${pkgs.system}".default
    inputs.caelestia-cli.packages."${pkgs.system}".default

    # school
    inputs.nixpkgs-netbeans.legacyPackages."${pkgs.system}".netbeans

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
    
    doom-emacs = {
      enable = true;
      doomDir = ./apps/emacs/doom;
      #emacs = pkgs.emacs-pgtk;
    };
  };

  services.vicinae = {
    enable = true;
  };

}

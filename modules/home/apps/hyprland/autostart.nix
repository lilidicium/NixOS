{ config, pkgs, ... }:{

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "caelestia shell"
      "hyprctl setcursor rose-pine-hyprcursor 36"
      "sudo nix-collect-garbage --delete-older-than 2d"
      "sudo rm /nix/var/nix/gcroots/auto/*"
      "sudo nix-store --optimise"
    ];
  };

}
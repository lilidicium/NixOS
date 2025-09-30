{ host, ... }: let
in {

  imports = [
    ./animations.nix
    ./autostart.nix
    ./cursor.nix
    ./decoration.nix
    ./hyprland.nix
    ./input.nix
    ./keybinds.nix
    ./layouts.nix
    ./monitors.nix
    ./render.nix
    ./sensitivity.nix
    ./windowrules.nix
  ];

}
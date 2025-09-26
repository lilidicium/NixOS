{ host, ... }: let

in {
    imports = 
    [
      ./hyprland.nix
      ./stylix.nix
      ./bash.nix
      ./zen.nix
      ./alacritty.nix
    ];
}
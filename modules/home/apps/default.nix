{ host, ... }: let
in {

imports = [
  ./alacritty.nix
  ./bash.nix
  ./hyprland.nix
  ./stylix.nix
  ./zen.nix
];

}
{ host, ... }: let
in {

imports = [
  ./alacritty.nix
  ./bash.nix
  ./hyprland.nix
  ./zen.nix
];

}
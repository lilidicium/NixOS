{ host, ... }:
let
in {

  imports = [
    ./alacritty.nix
    ./bash.nix
    ./hyprland
    ./zen.nix
  ];

}

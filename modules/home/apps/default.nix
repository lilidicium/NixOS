{ host, ... }:
let
in {

  imports = [
    ./alacritty.nix
    ./bash.nix
    ./hyprland
    ./neovim
    ./noctalia.nix
    ./zen.nix
  ];

}

{ host, ... }:
let
in {

  imports = [
    ./apps
    ./dotfiles
    ./packages.nix
    ./user.nix
    ./niri
  ];

}

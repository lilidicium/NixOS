{ host, ... }:
let
in {

  imports = [
    ./alacritty.nix
    ./bash.nix
    ./hyprland
    ./fastfetch.nix
    ./vscode.nix
    ./zen.nix
  ];

}

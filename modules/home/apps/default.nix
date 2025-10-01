{ host, ... }:
let
in {

  imports = [
    ./alacritty.nix
    ./bash.nix
    ./hyprland
    ./vscode.nix
    ./zen.nix
  ];

}

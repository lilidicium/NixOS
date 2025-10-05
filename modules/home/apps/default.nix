{ host, ... }:
let
in {

  imports = [
    ./alacritty.nix
    ./bash.nix
    ./hyprland
    ./vscode.nix
    ./neovim.nix
    ./zen.nix
  ];

}

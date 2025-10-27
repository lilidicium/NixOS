{ host, ... }:
let
in {

  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./boot.nix
    ./environmentvariables.nix
    ./greeter.nix
    ./network.nix
    ./packages.nix
    ./power.nix
    ./system.nix
    ./user.nix
  ];

}

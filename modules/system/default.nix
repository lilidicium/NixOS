{ host, ... }:
let
in {

  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./environmentvariables.nix
    ./greeter.nix
    ./network.nix
    ./packages.nix
    ./power.nix
    ./stylix.nix
    ./system.nix
    ./user.nix
  ];

}

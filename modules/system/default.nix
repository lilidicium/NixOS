{ host, ... }: let
in {

imports = [
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

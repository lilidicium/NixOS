{ host, ... }: let
in {

imports = [
	./bluetooth.nix
	./boot.nix
	./environmentvariables.nix
	./network.nix
	./packages.nix
	./power.nix
	./system.nix
	./user.nix
];

}

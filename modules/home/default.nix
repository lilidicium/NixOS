{ host, ... }: let
in {

imports = [
	./apps
	./packages.nix
	./user.nix
];

}

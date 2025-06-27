{
	description = "Maggie's NixOS config";

	inputs = {
	
		# NixOS official package source, using the nixos-25.05 branch here
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		
		zen-browser = {
			url = "github:/0xc000022070/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		sherlock = {
			url = "github:Skxxtz/sherlock";
			inputs.nixpkgs.follows = "nixpkgs";
		};


		stylix = {
			url = "github:nix-community/stylix/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		# home-manager, used for managing user configuration
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			# the `follows` keyword in inputs is used for inheritance.
			# here, `inputs.nixpkg` of home-manager is kept consistent with
			# the `inputs.nixpkg` of the current flake, to avoid
			# problems caused by different versions of nixpkgs.
			inputs.nixpkgs.follows = "nixpkgs";
			
		};
	};

	outputs = inputs@{ nixpkgs, stylix, home-manager, zen-browser, ... }: {
		nixosConfigurations = {
			nixos = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = {inherit inputs;};
				modules = [
					# Import configuration.nix
					./configuration.nix

					stylix.nixosModules.stylix
					
					# make home-manager a module of nixos
					# so that home-manager will be deployed
					# automatically when executing `nixos-rebuild switch`
					home-manager.nixosModules.home-manager {
						home-manager.useGlobalPkgs = true;
					 	home-manager.useUserPackages = true;
					 	home-manager.users.maggie = {
					 		imports = [
					 			./home.nix
					 		];
					 };
					 home-manager.extraSpecialArgs = {
					 	inherit inputs;
				   	 };
					 # optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
					}
				];
			};
		};	
	};
}

{
	description = "Your new nix config";

	inputs = {
		# Nixpkgs
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		# Home manager
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nur = {
			url = "github:nix-community/nur";
		};

		firefox-addons = {
			url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = {
		self,
		nixpkgs,
		home-manager,
		...
	} @ inputs: let
		inherit (self) outputs;
		unstable = import inputs.unstable {
			system = "x86_64-linux";
			config.allowUnfree = true;
			config.allowUnfreePredicate = _ : true;
		};
	in {
		# NixOS configuration entrypoint
		# Available through 'nixos-rebuild --flake .#your-hostname'
		nixosConfigurations = {

			nixos = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs outputs;
					unstable = unstable;
				};
				# > Our main nixos configuration file <
				modules = [./hosts/workstation/configuration.nix];
			};

			wsl = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs outputs;
					unstable = unstable;
				};
				modules = [./hosts/wsl/configuration.nix];
			};
		};

		# Standalone home-manager configuration entrypoint
		# Available through 'home-manager --flake .#your-username@your-hostname'
		homeConfigurations = {
			"xayah@nixos" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
					extraSpecialArgs = {
						inherit inputs outputs;
						unstable = unstable;
					};
				modules = [ ./hosts/workstation/home.nix ];
			};

			"xayah@wsl" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
					extraSpecialArgs = {
						inherit inputs outputs;
						unstable = unstable;
					};
				modules = [ ./hosts/wsl/home.nix ];
			};
		};

		homeModules.default = ./home;
		nixModules.default = ./modules;
	};
}

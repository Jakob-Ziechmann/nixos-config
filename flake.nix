{
	description = "Your new nix config";

	inputs = {
		# Nixpkgs
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs-channels/nixos-unstable";

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
	pkgsUnstable = import inputs.nixpkgs-unstable { 
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
					pkgsUnstable = pkgsUnstable;
				};
				# > Our main nixos configuration file <
				modules = [./hosts/workstation/configuration.nix];
			};

			wsl = nixpkgs.lib.nixosSystem {
				specialArgs = { 
					inherit inputs outputs; 
					pkgsUnstable = pkgsUnstable;
				};
				# > Our main nixos configuration file <
				modules = [./hosts/wsl/configuration.nix];
			};
		};

		# Standalone home-manager configuration entrypoint
		# Available through 'home-manager --flake .#your-username@your-hostname'
		homeConfigurations = {

			"xayah@nixos" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
					extraSpecialArgs = { 
						inherit inputs outputs; 
						pkgsUnstable = pkgsUnstable;
					};
				# > Our main home-manager configuration file <
				modules = [ ./hosts/workstation/home.nix ];
			};

			"xayah@wsl" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
					extraSpecialArgs = {
						inherit inputs outputs;
						pkgsUnstable = pkgsUnstable;
					};
				# > Our main home-manager configuration file <
				modules = [ ./hosts/wsl/home.nix ];
			};
		};

		homeModules.default = ./home;
		nixModules.default = ./modules;
	};
}

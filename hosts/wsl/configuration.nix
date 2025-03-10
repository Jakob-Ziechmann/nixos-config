# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, nixos-wsl, ... }:
{
	imports =
		[
			nixos-wsl.nixosModules.default {
				system.stateVersion = "24.05";
				wsl.enable = true;
			}
			./hardware-configuration.nix
			../../modules
		];

	wsl.enable = true;
	wsl.defaultUser = "xayah";

	nixpkgs.config.allowUnfree = true;
	virtualisation.docker.enable = true;

	users.users.xayah = {
		isNormalUser = true;
		description = "xayah";
		extraGroups = [ "networkmanager" "wheel" "docker"];
		shell = pkgs.zsh;
	};

	security.sudo = {
		enable = true;
		wheelNeedsPassword = true;
	};


	programs.zsh.enable = true;

	# NIXOS experimental
	nix.settings.experimental-features = [
		"nix-command"
		"flakes"
	];

	environment.systemPackages = with pkgs; [
		dconf
		xclip
		gnumake
	];

	system.stateVersion = "24.05"; # Did you read the comment?
}

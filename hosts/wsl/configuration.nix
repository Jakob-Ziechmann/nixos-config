# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:

{
	imports =
		[
			<nixos-wsl/modules>
			./hardware-configuration.nix
			../../modules
		];

	wsl.enable = true;
	wsl.defaultUser = "xayah";

	nixpkgs.config.allowUnfree = true;
	virtualisation.docker.enable = true;

	# Define a user account. Don't forget to set a password with ‘passwd’.
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

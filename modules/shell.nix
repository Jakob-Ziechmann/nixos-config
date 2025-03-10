{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		bash
	];

	environment.variables.BASH = "${pkgs.bash}/bin/bash";
	environment.shells = with pkgs; [ bash ];
	environment.pathsToLink = [ "/bin" ];
	environment.etc."bin/bash".source = "${pkgs.bash}/bin/bash";
}

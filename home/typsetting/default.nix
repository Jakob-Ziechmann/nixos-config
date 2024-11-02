{ pkgs, lib, ... }: {
	home.packages = with pkgs; [
		typst
		texliveFull
	];
}

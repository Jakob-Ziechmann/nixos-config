# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    ./theme.nix
    ./nvim.nix
    ./shell
    ./alacritty
    ./git.nix
    ./tmux
    ./gtk
    ./lf
    ./firefox.nix
		./typsetting
  ];

  # Allowing unfree nur
  nixpkgs = {
    overlays = [ inputs.nur.overlay ];
    config.allowUnfree = true;
  };

  theme = "rose-pine";

  home.packages = with pkgs; [
    darktable
    signal-desktop
  ];
}

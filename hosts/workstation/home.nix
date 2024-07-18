# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  outputs,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [ outputs.homeModules.default ];

  home = {
    username = "xayah";
    homeDirectory = "/home/xayah";
    stateVersion = "23.05";
  };

  nixpkgs = {
    # You can add overlays here
    overlays = [];
    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.packages = with pkgs; [
    youtube-music
    discord
    inkscape
    steam
    krita
  ];
}

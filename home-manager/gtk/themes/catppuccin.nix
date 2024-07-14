{ config, lib, pkgs, ... }: {
  options = {
    gtk-theme.catppuccin = lib.mkEnableOption "catppuccin theme";
  };

  config = lib.mkIf config.gtk-theme.catppuccin {
    gtk.iconTheme.name = "catppuccin";
    gtk.iconTheme.package = pkgs.catppuccin-papirus-folders;

    gtk.theme.name = "catppuccin";
    gtk.theme.package = pkgs.catppuccin-gtk;
  };
}

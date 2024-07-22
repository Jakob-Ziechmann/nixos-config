{ config, lib, pkgs, ... }: {
  options = {
    gtk-theme.rose-pine = lib.mkEnableOption "rose-pine theme";
  };

  config = lib.mkIf config.gtk-theme.rose-pine {
    gtk.iconTheme.name = "rose-pine";
    gtk.iconTheme.package = pkgs.rose-pine-icon-theme;

    gtk.theme.name = "rose-pine";
    gtk.theme.package = pkgs.rose-pine-gtk-theme;

    home.pointerCursor = {
      name = "BreezeX-RosePine-Linux";
      gtk.enable = true;
      x11.enable = true;
      size = 32;
      package = pkgs.rose-pine-cursor;
    };
  };
}

{ config, lib, ... }: {
  opitons = {
    gtk-theme.rose-pine = lib.mkEnableOption "rose-pine theme";
  };

  config = lib.mkIf config.gtk-theme.rose-pine {
    gtk.iconTheme.package = pkgs.rose-pine-icon-theme;
    gtk.iconTheme.name = "rose-pine";
  };
}

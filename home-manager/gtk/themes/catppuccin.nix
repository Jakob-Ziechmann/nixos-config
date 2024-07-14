{ config, lib, ... }: {
  opitons = {
    gtk-theme.catppuccin = lib.mkEnableOption "catppuccin theme";
  };

  config = lib.mkIf config.gtk-theme.catppuccin {
    
  };
}

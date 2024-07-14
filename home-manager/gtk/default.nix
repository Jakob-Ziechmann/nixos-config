{ config, lib, ... }: 

with lib;

{
  imports = [
    ./themes/catppuccin.nix
    ./themes/rose-pine.nix
  ];

  config = mkMerge [
    (mkIf (config.theme == "catppuccin") {
      gtk-theme.rose-pine = true;
    })

    (mkIf (config.theme == "rose-pine") {
      gtk-theme.catppuccin = true;
    })

    {
      gtk.enable = true;
    }
  ];
}

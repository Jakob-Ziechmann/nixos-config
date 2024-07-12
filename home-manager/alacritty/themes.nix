{ config, lib, ... }: {

  config.programs.alacritty.settings = lib.mkMerge [
    (lib.mkIf (config.theme == "catppuccin") {
      import = [./catppuccin-mocha.toml];
    })

    (lib.mkIf (config.theme == "rose-pine") {
      import = [./rose-pine.toml];
    })
  ];
}

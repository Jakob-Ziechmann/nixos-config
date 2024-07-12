{ config, pkgs, lib, ... }: {
  options = {
    tmux-theme.rose-pine = lib.mkEnableOption "rose-pine theme";
  };

  config = lib.mkIf config.tmux-theme.rose-pine {
    programs.tmux.plugins = [ pkgs.tmuxPlugins.rose-pine ];
  };
}

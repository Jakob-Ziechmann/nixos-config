{ config, lib, ... }:
{
  imports = [
    ./themes.nix
  ];

  home.shellAliases = { 
    tmux-reload = "tmux source ~/.config/tmux/tmux.conf";
  };

  programs.tmux = {
    enable = true;
  };
}

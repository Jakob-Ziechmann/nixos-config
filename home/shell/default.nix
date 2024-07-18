{ config, lib, ... }: 
let

  cfg = config.home;

in {
  imports = [
    ./zsh
  ];

  programs.zsh.shellAliases = cfg.shellAliases;
  programs.bash.shellAliases = cfg.shellAliases;
  programs.fish.shellAliases = cfg.shellAliases;

  home.shellAliases = {
    c = "clear";

    ls = "ls --color";
    la = "ls -la --color";
  };
}

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

    hm-update = "home-manager switch --flake ~/nixos-config/.#xayah@nixos";
    update = "sudo nixos-rebuild switch --flake ~/nixos-config/.#nixos";
  };
}

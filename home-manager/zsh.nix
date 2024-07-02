{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    
    shellAliases = {
      c = "clear";

      ls = "ls --color";
      la = "ls -la --color";

      hm-update = "home-manager switch --flake ~/nixos-config/.#xayah@nixos";
      update = "sudo nix-rebluild switch ~/nixos-config/.#nixos";
    };

    # extraPackages = with pkgs; [
    #   fzf
    #   zoxide
    # ];

    zinit = {
      enable = true;
    };
  };

  users.users."xayah".shell = pkgs.zsh;
}

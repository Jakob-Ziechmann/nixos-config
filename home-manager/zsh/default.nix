{ config, pkgs, ... }: {
  home.file.".p10k.zsh".source = ./p10k.zsh;

  programs.zsh = {
    enable = true;
    
    shellAliases = {
      c = "clear";

      ls = "ls --color";
      la = "ls -la --color";

      hm-update = "home-manager switch --flake ~/nixos-config/.#xayah@nixos";
      update = "sudo nixos-rebuild switch --flake ~/nixos-config/.#nixos";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    antidote = {
      enable = true;

      plugins = [
        "romkatv/powerlevel10k"
      
        # Plugins
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-completions"
        "zsh-users/zsh-autosuggestions"
        "Aloxaf/fzf-tab"
      ];
    };
  };

  programs.zsh.initExtra = ''
    # Powerlevel10k prompt
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  '';

  # Better Navigation
  programs.zoxide = {
    enable = true;

    options = [
      "--cmd cd"
    ];
  };

  # Fuzzy Finding
  programs.fzf = {
    enable = true;
  };
}

{ config, pkgs, ... }: {
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

    antidote = let 
      omzp = x: "ohmyzsh/ohmyzsh path:plugins${x}";
    in {
      enable = true;

      plugins = [
        "romkatv/powerlevel10k"
      
        # Plugins
        "zsh-users/zsh-syntax-highlighting"
        "zsh-users/zsh-completions"
        "zsh-users/zsh-autosuggestions"
        "Aloxaf/fzf-tab"

        # oh-my-zsh snippets
        (omzp "git")
        (omzp "git-auto-fetch")
        (omzp "aws")
        (omzp "kubectl")
        (omzp "kubectx")
        (omzp "command-not-found")
      ];
    };
  };

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

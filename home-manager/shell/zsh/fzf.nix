{ config, lib, ... }: {
  options = {
    zsh.fzf-tab = lib.mkEnableOption "fzf tab extension";
  };

  config = lib.mkIf config.zsh.enableP10k {
    programs.fzf.enable = true;

    programs.zsh = {
      antidote.plugins = ["Aloxaf/fzf-tab"];

      initExtra = ''
        zstyle ':fzf-tab:*' fzf-bindings 'ctrl-y:accept'
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
        zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
      '';
    };
  };
}

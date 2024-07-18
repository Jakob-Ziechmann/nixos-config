{ config, lib, ... }: {
  options = {
    zsh.completions = lib.mkEnableOption "better zsh completions";
  };

  config = lib.mkIf config.zsh.completions {
    programs.zsh = {
      antidote.plugins = [
        "zsh-users/zsh-completions"
        "zsh-users/zsh-autosuggestions"
      ];

      initExtra = ''
        bindkey '^p' history-serach-backward
        bindkey '^n' history-search-forward
        bindkey '^y' autosuggest-accept

        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
        zstyle ':completion:*' menu no
      '';
    };
  };
}

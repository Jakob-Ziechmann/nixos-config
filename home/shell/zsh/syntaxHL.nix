{ config, lib, pkgs, ... }: {
  options = {
    zsh.syntaxHighlighting = lib.mkEnableOption "highlight zsh prompt";
  };

  config = lib.mkIf config.zsh.syntaxHighlighting {
    programs.zsh = {
      antidote.plugins = ["zsh-users/zsh-syntax-highlighting"];

      initExtra = ''
        source ~/zsh/catppuccin-syntax-hl-mocha.zsh
      '';
    };

    home.file."./zsh/catppuccin-syntax-hl-mocha.zsh".source = 
      pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "zsh-syntax-highlighting";
        rev = "dbb1ec9";
        sha256 = "sha256-0B7g0J6+ZCoe1eErsSEmqO0aNOBi+FB+///vXnuiels";
      } + "/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
  };
}

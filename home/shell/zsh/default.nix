{ config, lib, ... }: {
  imports = [
    ./p10k.nix
    ./fzf.nix
    ./completion.nix
    ./history.nix
    ./syntaxHL.nix
  ];

  zsh.enableP10k = lib.mkDefault true;
  zsh.p10kInstantPrompt = lib.mkDefault true;
  zsh.fzf-tab = lib.mkDefault true;
  zsh.completions = lib.mkDefault true;
  zsh.leanHistory = lib.mkDefault true;
  zsh.syntaxHighlighting = lib.mkDefault true;

  programs.zsh = {
    enable = true;
    antidote.enable = true;

    defaultKeymap = "viins";

		sessionVariables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
		};
  };

  programs.zoxide = {
    enable = true;
    options = ["--cmd cd"];
  };
}

{
  imports = [
    ./lsp.nix
  ];

  programs.nixvim = {
    colorscheme.catppuccin.enable = true;
  }
}

{ config, pkgs, ...} : {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      xclip
      wl-clipboard

      luajitPackages.lua-lsp
      rnix-lsp
    ];
  };
}

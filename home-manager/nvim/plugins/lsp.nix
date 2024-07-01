{
  programs.nixvim.plugins.lsp = {
    enable = true;

    servers = {
      lua-ls.enable = true;
      nil-ls.enable = true;
      clangd.enable = true;
      typst-lsp.enable = true;
    };
  };
}

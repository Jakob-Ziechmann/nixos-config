{
  imports = [
    ./lsp.nix
  ];

  keymaps = {
    silent = true;
    #diagnostic = {
    #  "<leader>k" = "goto_prev";
    #  "<leader>j" = "goto_next";
    #};

    lspBuf = {
      gd = "definition";
      gD = "references";
      gt = "type_definition";
      gi = "implementation";
      K = "hover";
      "<F2>" = "rename";
    };
  };

  programs.nixvim = {
    colorschemes.catppuccin.enable = true;
  };
}

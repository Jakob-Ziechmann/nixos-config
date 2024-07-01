{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";

      providers.xclip.enable = true;
      providers.wl-copy.enable = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      hidden = true;

      swapfile = false;
      undofile = true;
      incsearch = true;
      inccommand = "split";
      ignorecase = true;

      scrolloff = 8;
      cursorcolumn = false;
      signcolumn = "yes";
      colorcolumn = "80";
      fileencoding = "utf-8";
      spell = false;
      wrap = false;

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
    };
  };
}

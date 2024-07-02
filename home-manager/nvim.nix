{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      # Lazy package manager
      unzip
      gnumake

      # Requirements for LSPs 
      cargo
      rustc
      gcc 
    ];
  };


#  imports = [
#    inputs.nixvim.homeManagerModules.nixvim
#    ./options.nix
#    ./completions.nix
#    ./plugins
#  ];
#
#  programs.nixvim = {
#    enable = true;
#    defaultEditor = true;
#
#    viAlias = true;
#    vimAlias = true;
#    vimdiffAlias = true;
#
#    luaLoader.enable = true;
#  };
}

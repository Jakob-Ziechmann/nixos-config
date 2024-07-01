{ inputs, ...} : {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
  ];

  # Absolutly incompetent writing minv
  home.shellAliases.nv = "nvim";
  home.shellAliases.nivm = "nvim";
  home.shellAliases.nimv = "nvim";

  # Replaing
  home.shellAliases.vi = "nvim";
  home.shellAliases.vim = "nvim";
}

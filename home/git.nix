{ lib, config, ... }: {
  options = {
    git.setCredentials = lib.mkEnableOption "username and email";
    git.addAliases = lib.mkEnableOption "useful git aliases";
  };


  config = lib.mkMerge [
    (lib.mkIf config.git.setCredentials {
      programs.git = {
        userName = "Jakob Ziechmann";
        userEmail = "48921293+Jakob-Ziechmann@users.noreply.github.com";
      };
    })
    
    (lib.mkIf config.git.addAliases {
      home.shellAliases = {
        gaa = "git add .";
        gs = "git status";
        gc = "git commit";
      };
    })

    {
      programs.git.enable = true;

      git.setCredentials = lib.mkDefault true;
      git.addAliases = lib.mkDefault true;
    }
  ];
}
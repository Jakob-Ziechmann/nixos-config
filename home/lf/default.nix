{ ... }: {
  xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;

    commands = {
      mkdirfile = ''
        ''${{
          printf "Directory: "
          read DIR
          mkdir $DIR
        }}
      '';
    };

    keybindings = {
      "\\\"" = "";
      o = "";
      d = "";
      e = "";
      f = "";
      U = "unselect";
      "<esc>" = "quit";
      dd = "cut";
      D = "delete";
      y = "copy";
      p = "paste";
      t = "mkdirfile";
      R = "rename";
      "." = "set hidden!";
      "<enter>" = "open";
    };
    settings = {
      preview = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };
  };
}

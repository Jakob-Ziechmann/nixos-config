{ config, lib, ... }: {
  options = {
    alacritty.theme.enableCatppuccin = 
      lib.mkEnableOption "use catppuccin mocha color theme";
  };

  config = lib.mkIf config.alacritty.theme.enableCatppuccin {
    programs.alacritty.settings = {
      bell = {
        animation = "EaseOutExpo";
        duration = 0;
      };

      colors = {
        draw_bold_text_with_bright_colors = true;
      };

      colors.primary = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        dim_foreground = "#7f849c";
        bright_foreground = "#cdd6f4";
      };

      colors.cursor = {
        text = "#1e1e2e";
        cursor = "#f5e0dc";
      };

      colors.vi_mode_cursor = {
        text = "#1e1e2e";
        cursor = "#b4befe";
      };

      colors.search.matches = {
        foreground = "#1e1e2e";
        background = "#a6adc8";
      };

      colors.search.focused_match = {
        foreground = "#1e1e2e";
        background = "#a6e3a1";
      };

      colors.footer_bar = {
        foreground = "#1e1e2e";
        background = "#a6adc8";
      };

      colors.hints.start = {
        foreground = "#1e1e2e";
        background = "#f9e2af";
      };

      colors.hints.end = {
        foreground = "#1e1e2e";
        background = "#a6adc8";
      };

      colors.selection = {
        text = "#1e1e2e";
        background = "#f5e0dc";
      };

      colors.normal = {
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
      };

      colors.bright = {
        black = "#585b70";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#a6adc8";
      };

      colors.dim = {
        black = "#45475a";
        red = "#f38ba8";
        green = "#a6e3a1";
        yellow = "#f9e2af";
        blue = "#89b4fa";
        magenta = "#f5c2e7";
        cyan = "#94e2d5";
        white = "#bac2de";
      };

      colors.indexed_colors = [
        {index = 16;
          color = "#fab387";}

        {index = 17;
          color = "#f5e0dc";}
      ];

      cursor = {
        blink_interval = 500;
        blink_timeout = 5;
        unfocused_hollow = false;
      };

      cursor.style = {
        blinking = "Off";
        shape = "Block";
      };
    };
  };
}
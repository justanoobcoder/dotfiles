{ pkgs, ... }:

let
  font = "JetBrainsMono Nerd Font";
in
{
  programs.alacritty = {
    enable = true;

    settings = {
      colors = {
        draw_bold_text_with_bright_colors = true;
        bright = {
          black = "#928374";
          blue = "#83a598";
          cyan = "#8ec07c";
          green = "#b8bb26";
          magenta = "#d3869b";
          red = "#fb4934";
          white = "#ebdbb2";
          yellow = "#fabd2f";
        };

        normal = {
          black = "#282828";
          blue = "#458588";
          cyan = "#689d6a";
          green = "#98971a";
          magenta = "#b16286";
          red = "#cc241d";
          white = "#a89984";
          yellow = "#d79921";
        };

        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
        };
      };

      window = {
        opacity = 0.95;
        title = "Alacritty";
        padding = {
          x = 0;
          y = 0;
        };
      };

      cursor.style = {
        blinking = "On";
        shape = "Beam";
      };

      scrolling.history = 5000;

      env = {
        TERM = "xterm-256color";
      };

      font = {
        normal = {
          family = font;
          style = "Regular";
        };

        bold = {
          family = font;
          style = "Bold";
        };

        italic = {
          family = font;
          style = "Italic";
        };

        bold_italic = {
          family = font;
          style = "Bold Italic";
        };

        size = 9.5;

        offset = {
          x = 0;
          y = 0;
        };

        glyph_offset = {
          x = 0;
          y = 0;
        };
      };
    };
  };
}

let
  inherit (import ../../../options.nix) terminal;

  footConfig = {
    foot = {
      enable = true;
      server.enable = true;
      settings = {
        main = {
            font = "JetBrainsMono Nerd Font:size=9.5";
        };
        colors = {
          alpha = terminal.opacity;
          background = terminal.colorScheme.primary.background;
          foreground = terminal.colorScheme.primary.foreground;
          regular0 = terminal.colorScheme.normal.black;
          regular1 = terminal.colorScheme.normal.red;
          regular2 = terminal.colorScheme.normal.green;
          regular3 = terminal.colorScheme.normal.yellow;
          regular4 = terminal.colorScheme.normal.blue;
          regular5 = terminal.colorScheme.normal.magenta;
          regular6 = terminal.colorScheme.normal.cyan;
          regular7 = terminal.colorScheme.normal.white;
          bright0 = terminal.colorScheme.bright.black;
          bright1 = terminal.colorScheme.bright.red;
          bright2 = terminal.colorScheme.bright.green;
          bright3 = terminal.colorScheme.bright.yellow;
          bright4 = terminal.colorScheme.bright.blue;
          bright5 = terminal.colorScheme.bright.magenta;
          bright6 = terminal.colorScheme.bright.cyan;
          bright7 = terminal.colorScheme.bright.white;
        };
      };
    };
  };

  kittyConfig = {
    kitty = {
      enable = true;
      font = {
        name = terminal.font.name;
        size = terminal.font.size;
      };
      shellIntegration.enableFishIntegration = true;
      settings = {
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        text_composition_strategy = "legacy";
        undercurl_style = "thin-sparse";

        background_opacity = "${toString terminal.opacity}";

        foreground = "#${terminal.colorScheme.primary.foreground}";
        background = "#${terminal.colorScheme.primary.background}";
        color0 = "#${terminal.colorScheme.normal.black}";
        color1 = "#${terminal.colorScheme.normal.red}";
        color2 = "#${terminal.colorScheme.normal.green}";
        color3 = "#${terminal.colorScheme.normal.yellow}";
        color4 = "#${terminal.colorScheme.normal.blue}";
        color5 = "#${terminal.colorScheme.normal.magenta}";
        color6 = "#${terminal.colorScheme.normal.cyan}";
        color7 = "#${terminal.colorScheme.normal.white}";
        color8 = "#${terminal.colorScheme.bright.black}";
        color9 = "#${terminal.colorScheme.bright.red}";
        color10 = "#${terminal.colorScheme.bright.green}";
        color11 = "#${terminal.colorScheme.bright.yellow}";
        color12 = "#${terminal.colorScheme.bright.blue}";
        color13 = "#${terminal.colorScheme.bright.magenta}";
        color14 = "#${terminal.colorScheme.bright.cyan}";
        color15 = "#${terminal.colorScheme.bright.white}";
      };
    };
  };

  alacrittyConfig = {
    alacritty = {
      enable = true;

      settings = {
        colors = {
          draw_bold_text_with_bright_colors = true;
          bright = {
            black = "#${terminal.colorScheme.bright.black}";
            blue = "#${terminal.colorScheme.bright.blue}";
            cyan = "#${terminal.colorScheme.bright.cyan}";
            green = "#${terminal.colorScheme.bright.green}";
            magenta = "#${terminal.colorScheme.bright.magenta}";
            red = "#${terminal.colorScheme.bright.red}";
            white = "#${terminal.colorScheme.bright.white}";
            yellow = "#${terminal.colorScheme.bright.yellow}";
          };
          normal = {
            black = "#${terminal.colorScheme.normal.black}";
            blue = "#${terminal.colorScheme.normal.blue}";
            cyan = "#${terminal.colorScheme.normal.cyan}";
            green = "#${terminal.colorScheme.normal.green}";
            magenta = "#${terminal.colorScheme.normal.magenta}";
            red = "#${terminal.colorScheme.normal.red}";
            white = "#${terminal.colorScheme.normal.white}";
            yellow = "#${terminal.colorScheme.normal.yellow}";
          };
          primary = {
            background = "#${terminal.colorScheme.primary.background}";
            foreground = "#${terminal.colorScheme.primary.foreground}";
          };
        };

        window = {
          opacity = terminal.opacity;
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
            family = terminal.font.name;
            style = "Regular";
          };

          bold = {
            family = terminal.font.name;
            style = "Bold";
          };

          italic = {
            family = terminal.font.name;
            style = "Italic";
          };

          bold_italic = {
            family = terminal.font.name;
            style = "Bold Italic";
          };

          size = terminal.font.size;

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
  };
in
{
  programs =
    if terminal.name == "kitty" then
      kittyConfig
    else if terminal.name == "foot" then
      footConfig
    else
      alacrittyConfig;
}

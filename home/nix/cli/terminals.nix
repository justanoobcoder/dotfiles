let
  inherit (import ../../../options.nix) terminal;

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

        foreground = terminal.colorScheme.primary.foreground;
        background = terminal.colorScheme.primary.background;
        color0 = terminal.colorScheme.normal.black;
        color1 = terminal.colorScheme.normal.red;
        color2 = terminal.colorScheme.normal.green;
        color3 = terminal.colorScheme.normal.yellow;
        color4 = terminal.colorScheme.normal.blue;
        color5 = terminal.colorScheme.normal.magenta;
        color6 = terminal.colorScheme.normal.cyan;
        color7 = terminal.colorScheme.normal.white;
        color8 = terminal.colorScheme.bright.black;
        color9 = terminal.colorScheme.bright.red;
        color10 = terminal.colorScheme.bright.green;
        color11 = terminal.colorScheme.bright.yellow;
        color12 = terminal.colorScheme.bright.blue;
        color13 = terminal.colorScheme.bright.magenta;
        color14 = terminal.colorScheme.bright.cyan;
        color15 = terminal.colorScheme.bright.white;
      };
    };
  };

  alacrittyConfig = {
    alacritty = {
      enable = true;

      settings = {
        colors = {
          draw_bold_text_with_bright_colors = true;
          bright = terminal.colorScheme.bright;
          normal = terminal.colorScheme.normal;
          primary = terminal.colorScheme.primary;
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

        env = { TERM = "xterm-256color"; };

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
  programs = if terminal.name == "kitty" then kittyConfig else alacrittyConfig;
}

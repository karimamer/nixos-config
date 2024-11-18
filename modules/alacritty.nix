{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.8;  # Matching your WezTerm opacity
        padding = {
          x = 50;  # Matching your WezTerm padding
          y = 50;
        };
        decorations = "buttonless";  # Similar to WezTerm's RESIZE
        dynamic_padding = true;
        blur = true;  # Equivalent to macos_window_background_blur
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 12.5;  # Matching your WezTerm font size
      };

      cursor = {
        style = {
          shape = "Underline";
          blinking = "On";
        };
        blink_interval = 750;  # Standard blink rate
        unfocused_hollow = true;
      };

      # Catppuccin Mocha theme colors
      colors = {
        primary = {
          background = "#1E1E2E";
          foreground = "#CDD6F4";
        };

        normal = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };

        bright = {
          black = "#585B70";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#A6ADC8";
        };
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      selection = {
        save_to_clipboard = true;
      };
    };
  };
}

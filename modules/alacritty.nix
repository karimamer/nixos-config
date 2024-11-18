{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      cursor.style = "Block";
      window = {
        opacity = 1.0;
        padding = {
          x = 24;
          y = 24;
        };
        decorations = "full";
        dynamic_padding = true;
      };
      font = {
        normal = {
          family = "MesloLGS NF";
          style = "Regular";
        };
        size = if pkgs.stdenv.hostPlatform.isDarwin then 14 else 10;
      };
      window.title = "Terminal";
      window.class = {
        instance = "Alacritty";
        general = "Alacritty";
      };
      colors = {
        primary = {
          background = "#1f2528";
          foreground = "#c0c5ce";
        };
        normal = {
          black = "#1f2528";
          red = "#ec5f67";
          green = "#99c794";
          yellow = "#fac863";
          blue = "#6699cc";
          magenta = "#c594c5";
          cyan = "#5fb3b3";
          white = "#c0c5ce";
        };
        bright = {
          black = "#65737e";
          red = "#ec5f67";
          green = "#99c794";
          yellow = "#fac863";
          blue = "#6699cc";
          magenta = "#c594c5";
          cyan = "#5fb3b3";
          white = "#d8dee9";
        };
      };
    };
  };
}

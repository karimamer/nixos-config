{
  programs.wezterm = {
    enable = true;
  };

  home.file = {
    ".configs/wezterm" = {
      source = ./configs/wezterm;
    };
  };
}

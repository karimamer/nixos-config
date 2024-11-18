{
  programs.fastfetch = {
    enable = true;
  };
  home.file = {
    ".configs/fastfetch" = {
      source = ./configs/fastfetch;
    };
  };
}

{ pkgs }:

with pkgs; [
  # General packages for development and system management
  zed-editor
  neovim
  alacritty
  bat
  btop
  coreutils
  killall
  neofetch
  openssh
  sqlite
  wget
  zip

  # Cloud-related tools and SDKs
  docker
  docker-compose

  # Media-related packages
  emacs-all-the-icons-fonts
  ffmpeg
  fd
  font-awesome
  hack-font
  meslo-lgs-nf

  # Text and terminal utilities

  hunspell
  jq
  ripgrep
  tree
  tmux
  unrar
  unzip
  zsh-powerlevel10k

  # Python packages
  pyenv
  uv

  arc-browser

  # rust
  rustup
  cargo-watch
  cargo-generate

  dockutil
]

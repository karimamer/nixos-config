{ pkgs }:

with pkgs; [
  # General packages for development and system management
  zed-editor
  neovim
  alacritty
  btop
  fastfetch
  openssh
  sqlite
  wget
  zip

  # Cloud-related tools and SDKs
  docker
  docker-compose


  # Text and terminal utilities

  hunspell
  jq
  ripgrep
  tree
  tmux

  just
  bat
  zoxide
  eza
  ripgrep

  jnv
  aria2

  neovim

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

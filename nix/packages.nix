{ pkgs, inputs, ... }:
with pkgs; [
#  neovim
  inputs.neovim-nightly-overlay.packages."x86_64-linux".default
  tmux
  git
  home-manager
  foot
  fastfetch
  zsh
  btop
  inputs.zen-browser.packages."x86_64-linux".twilight
  wofi
  inputs.vicinae.packages."x86_64-linux".default
  yazi
  lua-language-server
  ripgrep
  go
  nerd-fonts.jetbrains-mono
  fd
  skim
  hyprpaper
]

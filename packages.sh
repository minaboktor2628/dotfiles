#!/usr/bin/env bash

# gef debugger
bash -c "$(wget https://gef.blah.cat/sh -O -)"

packages=(
  tmux
  neovim
)

sudo apt install $packages -y

# tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

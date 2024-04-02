#!/bin/sh

# Copy any changes in tracked config files to this repo

cp -v ~/.zshrc .zshrc
cp -v ~/.local/share/fzf/key-bindings.zsh .local/share/fzf/key-bindings.zsh
cp -v ~/.config/tmux/tmux.conf .config/tmux/tmux.conf

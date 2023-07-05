#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

# Create dirs for code
mkdir -p ~/code ~/projects

# Install brew
# echo "Installing brew"
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install vim-plug
# echo "Installing vim-plug"
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install brew dependencies
# brew bundle install

# Stow dotfiles
export STOW_DIRS=config,zsh,git,tmux,yabai
for dir in $(echo $STOW_DIRS | sed "s/,/ /g"); do
  echo "stowing $dir";
  stow $dir -t ~;
done

source ~/.zshrc;

# Install nvim dependencies
#echo 'Installing/Updating Neovim plugins'
#nvim -c ':PlugInstall' -c ':UpdateRemotePlugins' -c ':qall'

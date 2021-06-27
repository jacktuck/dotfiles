#!/usr/bin/env zsh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

rsync --exclude ".git/" \
	--exclude ".DS_Store" \
	--exclude ".osx" \
	--exclude "bootstrap.sh" \
	--exclude "README.md" \
	--exclude "LICENSE-MIT.txt" \
	-avh --no-perms . ~;

mkdir -p ~/.config/nvim 
cp ~/.vimrc ~/.config/nvim/init.vim
cp -r .vim/* ~/.config/nvim/
source ~/.zshrc;

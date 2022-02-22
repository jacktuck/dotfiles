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

./iterm2/setup.sh

source ~/.zshrc;

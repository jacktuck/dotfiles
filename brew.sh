#!/usr/bin/env bash

# Install command-line tools using Homebrew.
brew update
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

brew install nvm
brew install pyenv
brew install rust
brew install gnu-sed
brew install wget
brew install gnupg
brew install vim
brew install grep
brew install openssh
brew install ripgrep
brew install git
brew install diff-so-fancy
brew install ssh-copy-id
brew install tree
brew install basictex
brew install aria2

# Remove outdated versions from the cellar.
brew cleanup

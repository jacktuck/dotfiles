# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/dotfiles/{zsh,work}/.{exports,path,prompt,functions,aliases,zshoptions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file

bindkey '^R' history-incremental-search-backward
source $(brew --prefix)/share/antigen/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle chriskempson/base16-shell

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

antigen apply

# Set theme
eval base16_material-darker


FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Load NVM
mkdir -p ~/.nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

[ ! -f "$HOME/z.sh" ] && wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O "$HOME/z.sh"
. "$HOME/z.sh"

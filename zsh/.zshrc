# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/dotfiles/{zsh,work}/.{exports,path,prompt,functions,aliases,zshoptions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file

# bindkey -v
source $(brew --prefix)/share/antigen/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle chriskempson/base16-shell

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

antigen apply

# Set theme
eval base16_material-darker

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

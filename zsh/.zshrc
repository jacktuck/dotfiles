# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,path,prompt,functions,aliases,zshoptions,ripjar}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file


# Add tab completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

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

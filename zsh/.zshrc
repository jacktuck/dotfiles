# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,prompt,exports,functions,aliases,zshoptions,ripjar}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file

# Add tab completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# bindkey -v
[ -d "/opt/homebrew" ] && source /opt/homebrew/share/antigen/antigen.zsh # for m1 mac
[ -d "/usr/local/homebrew" ] && source /usr/local/homebrew/share/antigen/antigen.zsh # for intel mac

antigen bundle zsh-users/zsh-autosuggestions

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

antigen apply

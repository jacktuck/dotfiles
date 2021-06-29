# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,prompt,exports,functions,aliases,zshoptions,extra,ripjar}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file

# Add tab completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


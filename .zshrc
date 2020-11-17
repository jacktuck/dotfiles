# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Add `~/.cargo/bin` to the `$PATH`
export PATH="$HOME/.cargo/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,prompt,exports,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# zmodload zsh/zprof

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/dotfiles/{zsh,work}/.{services,exports,aliases}; do
	[ -f "$file" ] && source "$file";
done;
unset file

export XDG_CONFIG_HOME="$HOME/.config"

FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice wait="1" lucid
zinit load agkozak/zsh-z


zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice wait="1" lucid
zinit light Aloxaf/fzf-tab

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"


zinit light starship/starship


export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bold"


# Try to find pyenv, if it's not on the path
export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# Lazy load pyenv
if type pyenv > /dev/null; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
            eval "$(command pyenv virtualenv-init -)"
        fi
        pyenv $@
    }
fi

command -v fnm > /dev/null && eval "$(fnm env)"

bindkey -e
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-search-backward
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '[[' vi-cmd-mode

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# zprof &> prof.txt
#
# Disable windows opening animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Prevent the Fn key from starting Dictation:
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# Mission control workaround for Aerospace
defaults write com.apple.dock expose-group-apps -bool true 

# Lazy directory switching
setopt auto_cd 

# History file location
export HISTFILE=~/.zsh_history

# Number of commands to keep in memory per session
export HISTSIZE=1000000

# Number of commands to save to HISTFILE
export SAVEHIST=1000000

# Share history across zsh sessions (replaces extended_history and inc_append_history)
setopt SHARE_HISTORY 
# Ignore duplicate commands in the history list
setopt HIST_IGNORE_DUPS
# Remove older duplicates when a command is repeated later
setopt HIST_IGNORE_ALL_DUPS
# Remove unnecessary blanks from history entries
setopt HIST_REDUCE_BLANKS
# Show command for confirmation before running history expansion
setopt HIST_VERIFY 
# Disable the beep sound on history expansion errors or completion
setopt NO_HIST_BEEP

source <(fzf --zsh)

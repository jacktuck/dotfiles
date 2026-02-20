# ------------------------------------------------
# Interactive shell configuration
# ------------------------------------------------

file=~/work-dotfiles/source
[ -f "$file" ] && source "$file"
unset file

FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit
compinit

# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice wait="1" lucid
zinit load agkozak/zsh-z

zinit ice wait lucid
zinit light zsh-users/zsh-history-substring-search

zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice wait="1" lucid
zinit light Aloxaf/fzf-tab

eval "$(starship init zsh)"

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bold"

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

# Keybindings
bindkey -e
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-search-backward
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '[[' vi-cmd-mode

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# Set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# Switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# Disable windows opening animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Prevent the Fn key from starting Dictation
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# Mission control workaround for Aerospace
defaults write com.apple.dock expose-group-apps -bool true 

# Lazy directory switching
setopt auto_cd 

# Auto-history settings
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

# -------------------------
# FZF (keep exactly as-is)
# -------------------------
source <(fzf --zsh)

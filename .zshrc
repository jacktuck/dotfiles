if [[ $- != *i* ]]; then
  return
fi

[[ -f ~/work-dotfiles/.source ]] && source ~/work-dotfiles/.source

# pipx binaries
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

[[ -d ${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh/site-functions ]] && FPATH="${HOMEBREW_PREFIX:-/opt/homebrew}/share/zsh/site-functions:${FPATH}"
[[ -d /usr/local/share/zsh/site-functions ]] && FPATH="/usr/local/share/zsh/site-functions:${FPATH}"
autoload -Uz compinit && compinit -u

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

zstyle ':prompt:pure:prompt:success' color '242'
zstyle ':prompt:pure:prompt:error' color '242'
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

if command -v pyenv > /dev/null; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        [[ -n ${ZSH_PYENV_LAZY_VIRTUALENV:-} ]] && eval "$(command pyenv virtualenv-init -)"
        command pyenv "$@"
    }
fi

bindkey -e
bindkey '^I'   complete-word
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-search-backward
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '[[' vi-cmd-mode

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' switch-group ',' '.'

if command -v defaults > /dev/null; then
    defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
    defaults write com.apple.HIToolbox AppleFnUsageType -int 0
    defaults write com.apple.dock expose-group-apps -bool true
fi

# Lazy directory switching
setopt auto_cd 

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

if command -v fnm > /dev/null; then
    eval "$(fnm env --use-on-cd --log-level quiet)"
fi

source <(fzf --zsh)

findrename () {
        fd $1 | xargs -n 1 rename "s/$1/$2/g"
}

findreplace () {
        rg $1 --files-with-matches -0 | xargs -0 gsed -i "s/$1/$2/g"
}

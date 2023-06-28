# zmodload zsh/zprof

setopt auto_cd # lazy directory switching
setopt append_history
setopt inc_append_history
setopt hist_find_no_dups
setopt hist_ignore_space
setopt no_hist_beep
setopt share_history # share history between session/terminals

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/dotfiles/{zsh,work}/.{services,exports,aliases}; do
	[ -f "$file" ] && source "$file";
done;
unset file


autoload -Uz compinit
compinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit load agkozak/zsh-z
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

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

PYENV_ROOT="${HOME}/.pyenv"
if [[ -d "$PYENV_ROOT}" ]]; then
  pyenv () {
    if ! (($path[(Ie)${PYENV_ROOT}/bin])); then
      path[1,0]="${PYENV_ROOT}/bin"
    fi
    eval "$(command pyenv init -)"
    pyenv "$@"
    unfunction pyenv
  }
else
  unset PYENV_ROOT
fi
eval "$(fnm env)"


bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-search-backward


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

# zprof

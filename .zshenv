# ------------------------------------------------
# ~/.zshenv
# Environment variables & PATH
# Loaded for all Zsh invocations (interactive or scripts)
# ------------------------------------------------

# Basic PATH additions
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

# Terminal type
export TERM="xterm-256color"

# Homebrew setup
[ -d "/opt/homebrew/bin" ] && eval "$(/opt/homebrew/bin/brew shellenv)"   # M1 / Apple Silicon
[ -d "/usr/local/homebrew/bin" ] && eval "$(/usr/local/homebrew/bin/brew shellenv)"  # Intel
export PATH="$HOMEBREW_PREFIX/bin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

# Make vim the default editor
export EDITOR='vim'

# Node.js REPL persistent history
export NODE_REPL_HISTORY=~/.node_history
# Allow 32³ entries; the default is 1000
export NODE_REPL_HISTORY_SIZE='32768'
# Use sloppy mode by default, matching web browsers
export NODE_REPL_MODE='sloppy'
export NODE_ENV='development'

# Python output encoding
export PYTHONIOENCODING='UTF-8'

# Manual page / less settings
# Highlight section titles in manual pages
export LESS_TERMCAP_md="${yellow}"
# Causes "raw" control characters to be displayed
export LESS=-Xr
# Don’t clear the screen after quitting a manual page
export MANPAGER='less -X'

# Suppress “default interactive shell is now zsh” warning on macOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# Ansible & Docker defaults
export ANSIBLE_SSH_ARGS="-o RemoteCommand=none"
export DOCKER_HOST=unix:///var/run/docker.sock

# fnm (Fast Node Manager) Node paths
command -v fnm > /dev/null && export NODE_14=$(realpath "$(fnm exec --using 14 which node)/..")
command -v fnm > /dev/null && export NODE_20=$(realpath "$(fnm exec --using 20 which node)/..")

# pyenv setup
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

# History file location
export HISTFILE=~/.zsh_history
# Number of commands to keep in memory per session
export HISTSIZE=1000000
# Number of commands to save to HISTFILE
export SAVEHIST=1000000

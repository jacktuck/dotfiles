export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.opencode/bin" ] && PATH="$HOME/.opencode/bin:$PATH"
[ -d "$HOME/.bin" ] && PATH="$HOME/.bin:$PATH"
export PATH

export TERM="${TERM:-xterm-256color}"
export EDITOR="${EDITOR:-vim}"

if [[ -z ${HOMEBREW_PREFIX:-} ]]; then
    for prefix in /opt/homebrew /usr/local/homebrew; do
        if [[ -x "$prefix/bin/brew" ]]; then
            eval "$("$prefix/bin/brew" shellenv)"
            break
        fi
    done
fi
[[ -n ${HOMEBREW_PREFIX:-} ]] && export HOMEBREW_CASK_OPTS="--appdir=$HOME/Applications"

export NODE_ENV="${NODE_ENV:-development}"
export NODE_REPL_HISTORY="$HOME/.node_history"
export NODE_REPL_HISTORY_SIZE='32768'
export NODE_REPL_MODE='sloppy'

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"

export PYTHONIOENCODING='UTF-8'
export LESS_TERMCAP_md=$'\e[1;33m'
export LESS='-Xr'
export MANPAGER='less -X'

export BASH_SILENCE_DEPRECATION_WARNING=1
export ANSIBLE_SSH_ARGS="-o RemoteCommand=none"
export DOCKER_HOST="unix:///var/run/docker.sock"

if command -v fnm > /dev/null; then
    [[ -z ${NODE_14:-} ]] && NODE_14=$(realpath "$(fnm exec --using 14 which node)/.." 2>/dev/null)
    [[ -z ${NODE_20:-} ]] && NODE_20=$(realpath "$(fnm exec --using 20 which node)/.." 2>/dev/null)
    export NODE_14 NODE_20
fi

export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
if [[ -d ${PYENV_ROOT}/bin ]] && [[ :$PATH: != *:"${PYENV_ROOT}/bin":* ]]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000

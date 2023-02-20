DIRS=("dotfiles")
cd ~
for dir in $(find code projects -mindepth 1 -maxdepth 1 -type d);
    do DIRS+=($dir);
done
DIRS=$(printf '%s\n' "${DIRS[@]}")

DIR=$(echo "$DIRS" | fzf-tmux -p --reverse --border-label "Switch project")
SESSION_NAME=$(echo "$DIR" | tr ' ' '_' | tr '.' '_')
SESSION_NAME=$(basename "$SESSION_NAME")

SESSION=$(tmux list-sessions | grep -F "^$SESSION_NAME$" | awk '{print $1}') # find existing session
SESSION=${SESSION//:/} # grab session name

if [ "$TMUX" = "" ]; then # if not currently in tmux
    if [ "$SESSION" = "" ]; then # session does not exist
        cd "$DIR" || exit 1 # jump to directory
        tmux new-session -s "$SESSION_NAME" # create session and attach
    else # session exists
        tmux attach -t "$SESSION" # attach to session
    fi
else # currently in tmux
    if [ "$SESSION" = "" ]; then # session does not exist
        cd "$DIR" || exit 1 # jump to directory
        tmux new-session -d -s "$SESSION_NAME" # create session
        tmux switch-client -t "$SESSION_NAME" # attach to session
    else # session exists
        tmux switch-client -t "$SESSION" # switch to session
    fi
fi
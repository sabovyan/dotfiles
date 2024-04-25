#!/bin/bash

mode=$1

function tm_work {
    local WORK_DIR=/home/sabovyan/projects/uc/diamond/data_volumes/microservice_catalog/ucraft-react/
    
    if [ ! -d "$WORK_DIR" ]; then
      echo "$WORK_DIR does not exist."
      exit 1
    fi

    cd $WORK_DIR || { echo "Failed to change directory to $WORK_DIR"; exit 1; }


    # create three new sessions
    tmux new-session -d -s "editor"
    tmux new-session -d -s "server"

    # open vim in the editor session
    tmux send-keys -t editor:1 'vim' C-m

    # create two panes in the server session
    tmux split-window -t server:1 -h

    # cd direectory into packages/ds and start the server
    tmux send-keys -t server:1.0 'cd packages/ds' C-m
    tmux send-keys -t server:1.0 'yarn start' C-m

    tmux attach-session -t editor
}

function tm_learn {
    cd /home/sabovyan/learn || { echo "Failed to change directory to /home/sabovyan/learn"; exit 1; }

    # learn should include just one session with three windows
    tmux new-session -d -s "learn"
    tmux new-window -t learn:1 -n "learn:notes"
    tmux send-keys -t learn:1 "nvim" C-m


    # tnux send-keys -t learn:1 'nvim' C-m

    tmux attach-session -t learn
}


function tm_start {

    if [ "$mode" = "work" ]; then
      tm_work
    elif [ "$mode" = "learn" ]; then
      tm_learn
    else
      echo "Invalid mode: $mode"
      exit 1
    fi
}

tm_start $mode

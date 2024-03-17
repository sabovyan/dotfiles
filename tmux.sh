#!/bin/bash


function tm_start_work() {

    local WORK_DIR="/home/sabovyan/projects/uc/diamond/data_volumes/microservice_catalog/ucraft-react/"
    
    if [ ! -d "$WORK_DIR" ]; then
      echo "$WORK_DIR does not exist."
      exit 1
    fi

    cd $WORK_DIR || { echo "Failed to change directory to $WORK_DIR"; exit 1; }


    # create three new sessions
    tmux new-session -d -s "editor"
    tmux new-session -d -s "server"
    tmux new-session -d -s "local"

    # open vim in the editor session
    tmux send-keys -t editor:1 'vim' C-m

    # create two panes in the server session
    tmux split-window -t server:1 -h

    # cd direectory into packages/ds and start the server
    tmux send-keys -t server:1.0 'cd packages/ds' C-m
    tmux send-keys -t server:1.0 'yarn start' C-m

    # cd into home/sabobyan/.config/nvim in the local session
    tmux send-keys -t local:1 'cd /home/sabovyan/.config/nvim' C-m


    tmux attach-session -t editor

}


tm_start_work

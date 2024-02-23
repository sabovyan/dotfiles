#!/bin/bash


function tm_start() {

  local DIRECTORY="/home/sabovyan/projects/uc/docker-server/project/frontend"

    
    if [ ! -d "$DIRECTORY" ]; then
      echo "$DIRECTORY does not exist."
      exit 1
    fi


    cd /home/sabovyan/projects/uc/docker-server/project/frontend/


    local session="editor"

    # Create a new tmux session
    tmux new-session -d -s $session

    # tmux send-keys -t $session:1.0 'cd /home/sabovyan/projects/uc/docker-server/project/frontend/' C-m
    tmux send-keys -t $session:1.0 'vim' C-m

    # Create the second window and split it into two panes
    tmux new-window -t $session:2 -n "Panes"
    tmux split-window -t $session:2 -h

    tmux send-keys -t $session:2.0 'cd packages/ds' C-m
    tmux send-keys -t $session:2.0 'npm start' C-m

    sleep 2



    # Select the second pane in the second window
    tmux select-pane -t $session:2.1

    # Attach to the tmux session
    tmux attach-session -t $session
}


tm_start

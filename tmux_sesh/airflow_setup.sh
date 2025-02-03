#!/bin/bash

SESH="airflow"

tmux has-sesion -t $SESH 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESH -n "nvim"

	tmux send-keys -t $SESH:nvim "cd ~/code/zynga/user-dataworkflows" C-m
	tmux send-keys -t $SESH:nvim "nvim ." C-m

	tmux new-window -t $SESH -n "server"
	tmux send-keys -t $SESH:server "cd ~/code/zynga/user-dataworkflows" C-m
	tmux send-keys -t $SESH:server "cd devops" C-m
	tmux send-keys -t $SESH:server "docker compose up" C-m

	tmux select-window -t $SESH:nvim

fi

tmux attach-session -t $SESH


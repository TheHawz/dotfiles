#!/bin/bash

SESH="gds-forecasting"

tmux has-sesion -t $SESH 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -d -s $SESH -n "nvim"

	tmux send-keys -t $SESH:nvim "cd ~/code/gds/forecasting-tool/" C-m
	tmux send-keys -t $SESH:nvim "nvim ." C-m

	tmux new-window -t $SESH -n "terminal"
	tmux send-keys -t $SESH:terminal "cd ~/code/gds/forecasting-tool/" C-m

	tmux select-window -t $SESH:nvim
fi

tmux attach-session -t $SESH


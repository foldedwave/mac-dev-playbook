#!/bin/sh
tmux new-session -s 'dev'
tmux rename-window 'task'
tmux new-window 'vim'
tmux new-window 'shell'

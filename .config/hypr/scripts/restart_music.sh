#!/bin/bash
# Start a new tmux session named with the current shell PID, running the tsession config

tmux new-session -s $$ "tmux source-file ~/.ncmpcpp/tsession"


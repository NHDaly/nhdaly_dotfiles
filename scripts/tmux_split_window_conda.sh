#!/bin/sh

# Splits the window and passes along the COND_ENV environmment variable.
# For this to work, activate.d must set the tmux buffer CONDA_ENV_FOR_PANE_#D
# to its current env. This script then reads that buffer variable back out and
# passes it to the new pane's shell.
# This is needed because this script is executed by the default tmux session's
# environment, not in the pane's shell, but the CONDA_ENV is stored only in the
# pane's shell.
#
# Passes any arguments along to split-window.

BUFFER_NAME="CONDA_ENV_FOR_PANE_$(tmux display-message -p  "#{pane_id}" | grep -o '[0-9]\+')"
tmux split-window "$@" "TMUX_NEW_CONDA_ENV=$(tmux show-buffer -b $BUFFER_NAME) /bin/zsh"


#! /bin/bash

SESSION_NAME=test

tmux new -s $SESSION_NAME -n w1 -d
tmux new-window -n w2
tmux new-window -n w3
tmux new-window -n w4

VIRTUALENV=youjin2_py3

tmux send-keys -t w1 "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t w2 "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t w3 "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t w4 "source venvs/$VIRTUALENV/bin/activate" Enter

tmux send-keys -t w1 "python multiprocess.py --n 100000000" Enter
tmux send-keys -t w2 "python multiprocess.py --n 100000000" Enter
tmux send-keys -t w3 "python multiprocess.py --n 100000000" Enter
tmux send-keys -t w4 "htop" Enter


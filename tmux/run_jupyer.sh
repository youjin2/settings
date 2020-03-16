#! /bin/bash

SESSION_NAME=jupyter
PYTHON_VERSION=3
BASE_PATH=/home/youjin2/work/youjin2/

tmux kill-session -t $SESSION_NAME
tmux new -s $SESSION_NAME -n jupyter -d
tmux new-window -n md
tmux new-window -n src
tmux new-window -n dir
tmux new-window -n monitor

# tmux split-window -h
# tmux split-window -h
# tmux select-layout even-horizontal
# tmux split-window -v
# tmux select-pane -t 0

if [[ $PYTHON_VERSION = 2* ]]
then
	VIRTUALENV=py2
else
	VIRTUALENV=py3
fi


tmux send-keys -t jupyter "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t md "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t src "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t dir "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t monitor "source venvs/$VIRTUALENV/bin/activate" Enter

tmux send-keys -t jupyter "jupyter notebook" Enter
tmux send-keys -t md "cd $BASE_PATH" Enter
tmux send-keys -t src "cd $BASE_PATH" Enter
tmux send-keys -t dir "cd $BASE_PATH" Enter
tmux send-keys -t monitor "cd $BASE_PATH" Enter

tmux send-keys -t md "" Enter
tmux send-keys -t src "" Enter
tmux send-keys -t dir "" Enter
tmux send-keys -t monitor "" Enter

tmux select-window -t md
# tmux split-window -h
# tmux select-pane -t 2

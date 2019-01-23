#! /bin/bash

SESSION_NAME=$1
PYTHON_VERSION=$2

tmux kill-session -t $SESSION_NAME
tmux new -s $SESSION_NAME -n base -d
tmux new-window -n src
tmux new-window -n util
tmux new-window -n data

# tmux split-window -h
# tmux split-window -h
# tmux select-layout even-horizontal
# tmux split-window -v
# tmux select-pane -t 0

if [[ $PYTHON_VERSION = 2* ]]
then
	VIRTUALENV=youjin2_py2
else
	VIRTUALENV=youjin2_py3
fi


tmux send-keys -t base "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t src "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t util "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t data "source venvs/$VIRTUALENV/bin/activate" Enter

tmux send-keys -t base "cd /home/yjlee/wolke/" Enter
tmux send-keys -t src "cd /home/yjlee/wolke/src/main/python/" Enter
tmux send-keys -t util "cd /home/yjlee/wolke/src/main/python/wolke/util/" Enter
tmux send-keys -t data "cd /mnt/groot/data/" Enter

tmux send-keys -t base "" Enter
tmux send-keys -t src "" Enter
tmux send-keys -t util "" Enter
tmux send-keys -t data "" Enter

tmux select-window -t src
tmux split-window -h
tmux select-pane -t 2
tmux send-keys -t 2 "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t src "cd /home/yjlee/wolke/src/main/python/wolke/" Enter
tmux send-keys -t src "" Enter

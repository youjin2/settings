#! /bin/bash

SESSION_NAME=$1
PYTHON_VERSION=$2

tmux new -s $SESSION_NAME -n python2 -d
tmux new-window -n python3
tmux send-keys -t python2 "source venvs/youjin2_py2/bin/activate" Enter
tmux send-keys -t python3 "source venvs/youjin2_py3/bin/activate" Enter

if [[ $PYTHON_VERSION = 2* ]]
then
	PYTHON_EXEC=python2
else
	PYTHON_EXEC=python3
fi
tmux send-keys -t $PYTHON_EXEC "jupyter notebook" Enter


#! /bin/bash

SESSION_NAME=$1
PYTHON_VERSION=$2

tmux new -s $SESSION_NAME -n fct3 -d
tmux new-window -n fct24
tmux new-window -n data
tmux new-window -n script

if [[ $PYTHON_VERSION = 2* ]]
then
	VIRTUALENV=youjin2_py2
else
	VIRTUALENV=youjin2_py3
fi
tmux send-keys -t fct3 "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t fct24 "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t data "source venvs/$VIRTUALENV/bin/activate" Enter
tmux send-keys -t script "source venvs/$VIRTUALENV/bin/activate" Enter

tmux send-keys -t fct3 "cd /home/yjlee/python/pvlib/scripts/" Enter
tmux send-keys -t fct24 "cd /home/yjlee/python/pvlib/scripts/" Enter
tmux send-keys -t data "cd /home/yjlee/python/pvlib/data/gfs_daily/" Enter
tmux send-keys -t script "cd /home/yjlee/python/pvlib/scripts/" Enter


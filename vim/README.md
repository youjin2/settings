# vim setting

* install bundle  
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  
```

* plugin example  
```
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
...
" Plugin 'git://git.wincent.com/command-t.git'
" Plugin 'file:///home/gmarik/path/to/plugin'
...
call vundle#end()
```

* Copy .vimrc to user's home directory  
```
$ cp .vimrc ~/  
```

* Copy .vim to user's home directory  
```
$ cp -rf .vim ~/  
```

* Install YCM python auto-complete plug-in  
```
$ cd ~/.vim/bundle
$ git clone https://github.com/Valloric/YouCompleteMe
$ cd YouCompleteMe/
$ git submodule update --init --recursive 
$ sudo apt-get install build-essential cmake
$ sudo apt-get install python-dev python3-dev
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.py --clang-completer
```

* activate vim plugins  
  - vim command mode  
  ```
  : PluginInstall
  ```
  - terminal  
  ```
  $ vim +PluginInstall +qall  
  ```
  

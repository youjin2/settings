# vim setting

* install bundle  
``` bash
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  
``` bash

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
``` bash
$ cp -rf .vim ~/  
```

* activate vim plugins  
  - vim command mode  
  ```
  : PluginInstall
  ```
  - terminal  
  ``` bash
  $ vim +PluginInstall +qall  
  ```
  

# vim setting

* install bundle  
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  

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
$ cp .vimrc ~/  

* Copy .vim to user's home directory  
$ cp -rf .vim ~/  

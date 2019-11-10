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
    # for python 2.x
    $ sudo apt-get install python-dev
    
    # for python 3.x
    $ sudo apt-get install python3-dev

    # install ycm
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

* use numpy-style docstring (vim-pydocstring plugin)
    ```
    $ cd numpy-doc/
    $ cp * ~/.vim/bundle/vim-pydocstring/template/pydocstring/
    ```

* vim markdown plugin
    - install 
        ```
        $ sudo apt-get install nodejs-legacy
        $ sudo apt-get install npm
        $ sudo npm install -g livedown
        ```
    - plugin to vim
        ```
        # add below to vimrc
        # port
        let g:livedown_port = 11000
        # launch/kill mapping to F8
        nmap <F8> :LivedownToggle<cr>
        ```

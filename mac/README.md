# Command Line Interface (CLI)에서 코딩하기
## 1. 터미널 설정
- bash\_profile (mac)
    -  시스템 환경변수, 명령어 등을 설정하는 스크립트
    -  설정 파일
        ```bash
        $ mv ~/.bash_profile ~/.bash_profile_old
        $ cp .bash_profile ~/
        ```
- fzf
    - history search, file/directory search에 유용한 plugin
    - 설치
        ```bash
        $ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        $ ~/.fzf/install
        ```
    - `.bash_profile`에 아래 라인 추가
        ```
        [ -f ~/.fzf.bash ] && source ~/.fzf.bash
        ```
    - 유용한 명령어
        - `ctrl + r`: history search
        - `ctrl + t`: file/directory search
        - `esc + c`: change directory (mac OS)
        - `ctrl + c`: change directory (others)
- tmux
    - 터미널 안에서 여러 가상화 세션을 사용할 수 있게 해주는 소프트웨어
    - 설치
        ``` bash
        $ brew install tmux
        ```
    - 설정 파일
        ``` bash
        $ cp ~/.tmux.conf ~/ 
        ```
    - session: 가상화 세션
        - window: 세션 내의 하위 창
            - pane: 창 내의 하위 화면(?)
    - 유용한 명령어
        - create new ssion
            ```bash
            $ tmux new -s "session_name"
            ```
        - binding key (ctrl + a): tmux 세션 내에서 명령어를 내릴때 사용되는 단축키
            - `binding key + c`: create new window 
            - `binding key + d`: detach tmux session
            - `binging key + "`: split horizontal pane
            - `binding key + %`: split vertical pane
            - `binding key + number`: change window 
            - `binding key + &`: kill window
            - `binding key + ,`: change window name
        - kill session
            ```bash
            $ tmux kill-session -t "session_name"
            ```
        - attach session
            ``` bash
            $ tmux attach -t "session_name"
            ```
        - show session list
            ```bash
            $ tmux ls
            ```

## 2. vim 설정
- vim
    - Character User Interface (CUI) 방식의 text editor
    - 자동완성, code 검색, 파일 검색 등 IDE에서 제공하는 강력한 기능들을 대부분 사용할 수 있음
    - .vimrc를 수정해서 plugin 등을 설정할 수 있음
- 유용한 plugin
    - Python syntax error check
        - 설치
            ```bash
            $ pip install flake8
            ```
            - .vimrc에 plugin에 다음 라인 추가
                ```
                Plugin 'scrooloose/syntastic' " flake8 required
                ```
    - NerdTree: file system explorer
        - 설치:
            - .vimrc에 plugin에 다음 라인 추가
                ```
                Plugin 'The-NERD-tree'
                ```
            - .vimrc에 다음 라인 추가
                ```
                map <F3> :NERDTreeToggle<cr>
                nmap <silent> <C-m> <Plug>(pydocstring)
                " close vim if remaining window is only nerdtree
                autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
                " open nerdtree by default
                autocmd vimenter * NERDTree
                " jump to main window
                autocmd VimEnter * wincmd p
                " show hidden files
                let NERDTreeShowHidden=1
                ```
    - YouCompleteMe: python auto-complete
        - 설치
            - install ycm
                ```bash
                $ brew install cmake
                $ cd ~/.vim/bundle
                $ git clone https://github.com/Valloric/YouCompleteMe
                $ git submodule update --init --recursive 
                $ ./install.py --clang-completer
                ```
            - .vimrc plugin에 다음 라인 추가
                ```
                Plugin 'Valloric/YouCompleteMe' " python auto-complete
                ```
    - livedown: markdown 편집기
        - 설치
            ```bash
            $ brew install node
            $ brew install npm
            $ npm install -g livedown
            ```
        - `.vimrc`에 다음 라인 추가
            ```
            # port
            let g:livedown_port = 11000
            # launch/kill mapping to F8
            nmap <F8> :LivedownToggle<cr>
            ```
        - 사용법
            - `F8`: local 11000포트에 마크다운 문서 렌더링
            - 포트 또는 key-mapping 변경은 vimrc에서 위에 해당하는 라인을 수정
    - fzf: fuzzy finder를 vim에 적용
        - 설치
            - 위 터미널 설정의 fzf설치 과정 실행
            - .vimrc plugin 다음 라인 추가
                ```
                Plugin 'junegunn/fzf.vim'
                ```
            - `:PluginInstall` 실행
            - .vimrc에 다음 라인 추가
                ```
                " fzf
                set rtp+=~/.fzf
                " map :FZF to ctrl + p
                nnoremap <silent> <C-p> :FZF -m<cr>
                ```
        - 사용법
            - `ctrl + p`: fzf search 실행
                - `ctrl + x`: split horizontal window
                - `ctrl + v`: split vertical window
            - key-mapping 변경은 vimrc에서`<C-p>`를 수정
    - ack: silver-searcher
        - 설치
            - install silver search
                ```bash
                # https://github.com/ggreer/the_silver_searcher#installing
                # mac
                $ brew install the_silver_searcher
                # linux
                $ apt-get install silversearcher-ag
                ```
            - install ack plugin: vimrc plugin에 다음 라인 추가
                ``` bash
                Plugin 'mileszs/ack.vim' " ack search
                ```
            - .vimrc에 다음 라인 추가
                ```
                " ack silver search
                " set runtimepath^=~/.vim/bundle/ag
                if executable('ag')
                    let g:ackprg = 'ag --vimgrep'
                endif
                ```
        - 사용법
            - 코드검색
                ```
                :Ack! "keyword" "directory"
                ```
                - `t`: open new tab
                - `T`: open new tab, keep focus on the results
                - `h`: split horizontal window
                - `H`: split horizontal window, keep focus on the results
                - `v`: split vertical window
                - `gv`: split vertical window, keep focus on the results
    - surround
        - 설치: .vimrc에 다음 라인 추가
            ```
            ```
        - 사용법
            - add quotation, parentheses
                - `ysw`
                - `ysiw`
                - `ysNaw`
            - delete quotation, parentheses
                - `ds`
            - replace quotation, parantheses
                - `cs`

## 3. 기타
- pybuilder
    - python package manager
    - install
        ```bash
        # activate virtualenv
        $ source /path/to/my/env/bin/activate

        # python 3.7
        $ pip install -U --pre pybuilder

        # others
        $ pip install pybuilder
        ```
    - 사용법
        - set project path
            ```bash
            $ mkdir woowa && cd woowa
            ```
        - start project
            ```bash
            $ pyb --start-project
            ```
        - install project
            ```bash
            $ cd src/main/python
            $ mkdir woowa && cd woowa
            $ touch __init__.py
            $ mkdir loader && cd loader
            $ touch __init__.py
            $ touch my_module.py
            ```
- task spooler
    - unix batch system manager
    - install
        ```bash
        $ brew install task-spooler
        ```
    - 사용법
        - batch job 여러개 실행
            ```bash
            $ ts python run.py --option1 >> exp1
            $ ts python run.py --option2 >> exp2
            $ ts python run.py --option3 >> exp3
            ```
        - 옵션 (https://vicerveza.homeunix.net/~viric/soft/ts/)
            - `ts -l`: show job list
            - `ts -c "number"`: show result of job "number"
            - `ts -i "number"`: show information of job "number"
            - `ts -C`: clear the finished jobs
            - `ts -K`: kill task-spooler

# R settings

* Rstudio hanguel  
(ref: https://minjejeon.github.io/learningstock/2016/11/29/troubleshooting-korean-input-problem-in-rstudio-spyder-ubuntu.html  
      https://blog.goo.ne.jp/ikunya/e/8508d21055503d0560efc245aa787831)  
    - Method1: package install (일본 블로그(いくやの斬鉄日記)에서 패치한 fcitx)
        ```
        $ wget http://ikuya.info/tmp/fcitx-qt5-rstudio.tar.gz
        $ tar xf fcitx-qt5-rstudio.tar.gz
        $ cd fcitx-qt5-rstudio
        $ sudo apt install ./fcitx-frontend-qt5-rstudio_1.0.5-1_amd64.deb ./libfcitx-qt5-1-rstudio_1.0.5-1_amd64.deb
        ```
    - Method2: install rstudio-server (설치 후 웹브라우저에서 http://127.0.0.1:8787로 접속)  
    (ref: https://www.rstudio.com/products/rstudio/download-server/)  
        ```
        $ sudo apt-get install r-base gdebi-core
        $ wget https://download2.rstudio.org/rstudio-server-1.0.44-amd64.deb
        $ sudo gdebi rstudio-server-1.0.44-amd64.deb
        (현재 최신 버전인 64bit rstudio-server 1.0.44 기준)
        ```


* rJava, Java installation  
(ref: https://opentutorials.org/module/516/5558  
 http://ririsdata.blogspot.kr/2016/10/rubuntu-java-rjava.html)  
    ```
    $ sudo apt-get install r-cran-rjava  
    $ sudo R CMD javareconf 
    # KoNLP
    $ sudo apt-get install libcurl4-openssl-dev
    ```

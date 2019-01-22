# Python settings

* Jupyter notebook settings
    - bash
        ```
        $ jupyter notebook --generate-config
        $ ipython
        ```
    - ipython
        ``` python
        from notebook.auth import passwd
        passwd()
        ```
    - allow port for external connection  
    (ref: http://programmingskills.net/archives/308)  
        ```
        $ sudo ufw allow `port`/tcp
        ```

    - change notebook theme  
    (ref: https://github.com/dunovank/jupyter-themes)  
        ```
        $ pip install jupyterthemes
        $ pip install --upgrade jupyterthemes
        $ jt -t monokai -T -N -fs 10 -nfs 9 -cellw 1200 -lineh 120
        ```

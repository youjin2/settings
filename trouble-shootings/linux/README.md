# Linux commands
* chown
    - Change group permission
        ``` bash
        $ chown {owner}:{group} {file_or_directory}
        # recursive for sub directories
        $ chown -R {owner}:{group} {file_or_directory}
        ```


* Slack
    - External link opened as blank tab in new browser in Chrome
        ```
        $ cd /home/`user`/.local/share/applications
        $ vim google-chrome.desktop
        # add space and %U as below and save
        # Exec=/opt/google/chrome/chrome %U
        ```

* VirtualBox
    - Change Booting order
        - settings -> system -> motherboard -> booting order
            - Floppy Disk
            - Hard Disk
            - Optical Disk
    - Set network drive  
    (ref: http://song2song2.tistory.com/entry/VirtualBoxnetprint)
        - Devices -> Network -> Network Settings
            - change "Attached to" to "Bridged Adaptor"
        - Devices -> Network -> Connect Network Adaptor
        - Add network printer again

* Bluetooth
    - Connect MS designer mouse on Ubuntu 16.04  
    (ref: https://askubuntu.com/questions/835652/bluetooth-keyboard-paired-but-not-responding-16-04?rq=1)
        - Step 1:
            ``` bash
            $ sudo apt-get install bluez blueman
            ```
        - Step 2:
            ``` bash
            $ sudo nano /etc/bluetooth/main.conf
                - Change line 67, uncomment #[Policy] so that it reads [Policy] 
                - Change line 89, uncomment and change #AutoEnable=false so that it reads
                - set AutoEnable=true
            ```
        - Step 3:
            ``` bash
            $ sudo nano /lib/udev/rules.d/50-bluetooth-hci-auto-poweron.rules
                - Change line 1 to comment out:
                - #ACTION=="add", SUBSYSTEM=="bluetooth", KERNEL=="hci[0-9]*", RUN+="/bin/hciconfig %k up"
                - it seems that i have to comment out both of line 1 and 2
            ```
        - Step 4:
            - Save and Reboot
        - Step 5:
            - From the second (blueman) bluetooth icon on the top menu bar, choose "Local Services"
              then under "Pan support" choose "blueman (dhclient)". Click Apply or don't worry if it
              isn't enabled, you can just close the window.
        - Step 6:
            - Choose "Setup New Device" from the same window. Press the pairing button on the mouse,
              so the blue lights start flashing (it's a really small button that I missed at first).
              Complete the wizard, and your mouse should be paired.
    - Cannot find download directory
        - If you have a following message after booting your system
            ___
            Please make sure that **/home/user/my_directory/** directory exists or configure it with blueman-services
            - Go to `org -> blueman -> transfers`
            ___
            ```
            $ dconf-editor
            ```
        - Edit `shared path` to appropriate directory
        
* wget
    - Ignore requiring --no-check-certificate option
        - add `check-certificate=off` to `~/.wgetrc`

* fzf
    - useful commands
        - history search: `ctrl + r`
        - vim command mode: `:FZF ~/search_directory`

* User/Group
    - add new user
        ``` bash
        $ sudo adduser "user"
        ```        
    - add existing user to exiting group
        ``` bash
        $ sudo usermod -a -G "group" "user"
        ```

* about ssl certificate problem on ubnutu 18.04
    ``` bash
    $ sudo update-ca-certificates --fresh
    $ export SSL_CERT_DIR=/etc/ssl/certs
    ```

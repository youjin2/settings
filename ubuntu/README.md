# OS: ubuntu16.04.3

* mount additional HDD  
(ref: http://reachlab-kr.github.io/linux/2015/10/03/Ubuntu-fstab.html)  
```
# check external HDD
$ sudo su
$ fdisk -l
# e.g. partion 1, first/last sector: default, w
$ fdisk /dev/sdb
# format file system
$ sudo mkfs.ext4 /dev/sdb1
# check uuid
$ sudo blkid
# add partition to fstab
$ sudo vi /etc/fstab (auto-mount)
# e.g. UUID=0220b7c5-2eb6-4586-9dcc-cb854f5f7e46 /mnt/sdb1               ext4    defaults 0       0 
# mount
$ sudo mkdir /mnt/sdb1
$ sudo mount -a
# check result
$ df -h
```

* booting problems
    - dell xps13-9360
        - booting problem
    ```
    $ sudo vim /etc/default/grub
    # change pcie_aspm=off
    # GRUB_CMDLINE_LINUX_DEFAULT="quiet splash pcie_aspm=off"
    ```
    - Gigabyte X299 UD4 Pro
        - random reboot problem
        - hyper-threading is impossible
    ```
    $ sudo vim /etc/default/grub
    # change acpi=off
    # GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi=off"
    ```

* user settings  
    - add user  
    (ref: http://mirwebma.tistory.com/112)  
    ```
    $ adduser yjlee
    ```

    - add sudo user  
    (ref: http://firstboos.tistory.com/entry/sudo-user-%EC%B6%94%EA%B0%80)  
    ```
    $ sudo vim /etc/sudoers
    $ yjlee   ALL=(ALL:ALL) ALL
    ```

* ssh settings  
    - ssh install/connection  
    (ref: http://programmingskills.net/archives/315)
    ```
    $ sudo apt-get install openssh-server openssh-client
    $ sudo apt-get install ssh
    # firewall setting for remote server (also needs port-forwarding)
    $ sudo service ssh restart
    $ sudo ufw enable
    $ sudo ufw allow 22
    $ sudo ufw status verbose
    # compare sshd_config settings
    ```

    - ssh/scp connection without password  
    (ref: https://askubuntu.com/questions/762541/ubuntu-16-04-ssh-sign-and-send-pubkey-signing-failed-agent-refused-operation  
          http://thswave.github.io/linux/2016/01/14/ssh-without-password.html)  
    ```
    # local
    $ ssh-keygen -t rsa
    $ cat id_rsa.pub | ssh id@ip -p port 'cat >> .ssh/authorized_keys'
    ```
    - share clipboard b/w local/remote
    ```
    # local/remote
    $ sudo apt-get install xclip
    # local: change ForwardX11 to yes
    $ sudo vim /etc/ssh/ssh_config
    # remote: add X11Forwarding to yes
    $ /etc/sshd/sshd_config
    # local
    $ ssh-add
    $ ssh-add -l
    ```

* Mount remote path to local path
```
$ sudo apt-get install sshfs
# mac
$ sudo sshfs -o allow_other,defer_permissions yjlee@ip:/path/to/mount /path/to/mount
# ubuntu
$ sudo sshfs -o allow_other,default_permissions yjlee@ip:/path/to/mount /path/to/mount
```

* python installation 
    - step1: install before python3 installation  
    (ref: https://tecadmin.net/install-python-3-6-ubuntu-linuxmint/#)
    ```
    $ sudo apt-get install build-essential checkinstall
    $ sudo apt-get install libreadline-gplv2-dev  libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
    ```
    - step2: install python3  
    (ref: https://www.rosehosting.com/blog/how-to-install-python-3-6-on-ubuntu-16-04/)  
    ```
    $ cd /opt
    $ wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
    $ tar -xvf Python-3.6.3.tgz
    $ cd Python-3.6.3
    $ ./configure --enable-optimizations
    $ make
    $ make install
    ```
    - If you get the following error message  
    `zipimport.ZipImportError: can't decompress data; zlib not available`
    ```
    $ sudo apt-get install zlib1g-dev
    ```
    - run again
    ```
    $ make
    $ make install
    ```

* You have broken packages (apt-get install) so use these steps  
``` 
# Fix broken packages:
$ sudo apt -f install
# Update:
$ sudo apt update && sudo apt dist-upgrade
# Now install normally:
$ sudo apt install python3-pip
# Check if it installed:
$ pip3 --version
# That should fix that.
```

* If you get the following messages for when download via apt-get   
`kr.archive.com 404 not found error`  
```
$ cd /etc/apt
$ sudo cp sources.list old_sources.list
$ sudo vim sources.list
# vim command mode
: %s /kr.archive.ubuntu.com/ftp.daum.net/g
$ sudo apt-get update
```

# OS: ubuntu16.04.3

* add user  
(ref: http://mirwebma.tistory.com/112)  
```
$ adduser yjlee
```

* add sudo user  
(ref: http://firstboos.tistory.com/entry/sudo-user-%EC%B6%94%EA%B0%80)  
```
$ sudo vim /etc/sudoers
$ yjlee   ALL=(ALL:ALL) ALL
```

* ssh setting  
```
# http://programmingskills.net/archives/315
$ sudo apt-get install openssh-server openssh-client
$ sudo apt-get install ssh
# additional
# sudo vim /etc/ssh/sshd_config
$ sudo service ssh restart
$ sudo ufw enable
$ sudo ufw allow 22
$ sudo ufw status verbose
```


## mount additional HDD
# http://reachlab-kr.github.io/linux/2015/10/03/Ubuntu-fstab.html
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
$ sudo vi /etc/fstab
# e.g. UUID=0220b7c5-2eb6-4586-9dcc-cb854f5f7e46 /mnt/sdb1               ext4    defaults 0       0 
# mount
$ sudo mkdir /mnt/sdb1
$ sudo mount -a
$ df -h


## install python3
https://www.rosehosting.com/blog/how-to-install-python-3-6-on-ubuntu-16-04/

$ cd /opt
$ wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
$ tar -xvf Python-3.6.3.tgz
$ cd Python-3.6.3
$ ./configure --enable-optimizations
$ make
$ make install

If you get the following error message
zipimport.ZipImportError: can't decompress data; zlib not available
$ apt-get install zlib1g-dev

run again
$ make
$ make install


## install bundle
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


## install YCM
$ git clone https://github.com/Valloric/YouCompleteMe
$ git submodule update --init --recursive 
$ sudo apt-get install build-essential cmake
$ sudo apt-get install python-dev python3-dev
$ cd ~/.vim/bundle/YouCompleteMe
$ ./install.py --clang-completer


## fix broken package problems
You have broken packages so use these steps:

Fix broken packages:
sudo apt -f install
Update:
sudo apt update && sudo apt dist-upgrade
Now install normally:
sudo apt install python3-pip
Check if it installed:
pip3 --version
That should fix that.


## install below before python3 installation
https://tecadmin.net/install-python-3-6-ubuntu-linuxmint/#
$ sudo apt-get install build-essential checkinstall
$ sudo apt-get install libreadline-gplv2-dev  libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev


## mysql install
$ sudo apt-get install libmysqlclient-dev


## psycopg2 install
$ sudo apt install libpq-dev python-dev


## jupyter notebook settings
$ jupyter notebook --generate-config
line 162: c.NotebookApp.ip = '*'
line 208: c.NotebookApp.open_browser = False
line 228: c.NotebookApp.port = 13000
$ ipython
from notebook.auth import passwd
passwd()
# allow external port 13000 to internal port 13000
# http://programmingskills.net/archives/308
# lowton: external 23 to internal 22
sudo ufw allow 13000/tcp
# notebook theme setting
# https://github.com/dunovank/jupyter-themes
$ pip install jupyterthemes
$pip install --upgrade jupyterthemes
$ jt -t monokai -T -N -fs 10 -nfs 9 -cellw 1200 -lineh 120


## kr.archive.com 404 not found error
$ cd /etc/apt
$ sudo cp sources.list old_sources.list
$ sudo vim sources.list
$ %s /kr.archive.ubuntu.com/ftp.daum.net/g
$ sudo apt-get update


## ssh without password
$ sudo apt-get install xclip
(both remote, local)
$ ssh-keygen -t rsa
(local)
$ cat id_rsa.pub | ssh id@ip -p port 'cat >> .ssh/authorized_keys'
(local)
change ForwardX11 yes in /etc/ssh/ssh_config
(local)
add X11Forwading yes in /etc/sshd/sshd_config
(remote)
$ ssh-add
$ ssh-add -l
(local check ssh)
https://askubuntu.com/questions/762541/ubuntu-16-04-ssh-sign-and-send-pubkey-signing-failed-agent-refused-operation
http://thswave.github.io/linux/2016/01/14/ssh-without-password.html
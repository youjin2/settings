# Python trouble-shootings

* Package install troubleshootings
    - mysql
        ```
        $ sudo apt-get install libmysqlclient-dev
        ```
    - psycopg2
        ```
        $ sudo apt install libpq-dev python-dev
        ```

* Install tensorflow-gpu (**Not working with ubuntu18.04**)
    - Install nvidia graphic driver  
    (https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux)
        - Step1: Detect the model of your nvidia graphic card and the recommended drive
            ``` bash
            $ ubuntu-drivers devices
            ```
        - Step2: Install desired driver selectively using the apt command
            ```
            # e.g.
            $ sudo apt-get install nvidia-driver-390
            ```
        - Step3: Once the installation is concluded, reboot your system and you are done.
    - Install CUDA Toolkit 10.0  
    (https://developer.nvidia.com/cuda-toolkit)  
    (https://medium.com/@taylordenouden/installing-tensorflow-gpu-on-ubuntu-18-04-89a142325138)
        - **os: ubuntu 18.04**
            ``` bash
            $ wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_410.48_linux --no-check-certificate 
            $ mv cuda_10.0.130_410.48_linux cuda_10.0.130_410.48_linux.run
            $ sudo chmod +x cuda_10.0.130_410.48_linux.run
            $ sudo ./cuda_10.0.130_410.48_linux.run --override

            # install settings
            -----------------
            Do you accept the previously read EULA?
            accept/decline/quit: accept

            Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 410.48?
            (y)es/(n)o/(q)uit: no

            Install the CUDA 10.0 Toolkit?
            (y)es/(n)o/(q)uit: yes

            Enter Toolkit Location
             [ default is /usr/local/cuda-10.0 ]: 

             Do you want to install a symbolic link at /usr/local/cuda?
             (y)es/(n)o/(q)uit: yes

             Install the CUDA 10.0 Samples?
             (y)es/(n)o/(q)uit: yes

             Enter CUDA Samples Location
              [ default is /home/yjlee ]: 
            -----------------

            # add below lines to ~/.bashrc
            -----------------
            export LD_LIBRARY_PATH="/usr/local/cuda-10.0/lib64":${LD_LIBRARY_PATH}
            export PATH="/usr/local/cuda-10.0/bin":$PATH
            -----------------

            $ nvcc --version
            # you can see below messages if installed appropriately
            -----------------
            nvcc: NVIDIA (R) Cuda compiler driver
            Copyright (c) 2005-2018 NVIDIA Corporation
            Built on Sat_Aug_25_21:08:01_CDT_2018
            Cuda compilation tools, release 10.0, V10.0.130
            -----------------
            ```
    - Install cuDNN v7.4.2 for CUDA 10.0  
    (https://developer.nvidia.com/cudnn)
        ``` bash
        # cuDNN Library for Linux
        $ tar -xvf cudnn-10.0-linux-x64-v7.4.2.24.tgz
        $ cd cuda

        # Move the unpacked contents to your CUDA directory
        $ sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-10.0/lib64/
        $ sudo cp cuda/include/cudnn.h /usr/local/cuda-10.0/include/

        # Give read access to all users
        $ sudo chmod a+r /usr/local/cuda-10.0/include/cudnn.h
        $ sudo chmod a+r /usr/local/cuda-10.0/lib64/libcudnn*

        # you can see CUDNN_MAJOR if installed appropriately
        $ cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
        ```
    - Install NCCL v2.3.7 for CUDA 10.0  
    (https://developer.nvidia.com/nccl/nccl-download)
        ``` bash
        # O/S agnostic local installer
        $ tar -xvf nccl_2.3.7-1+cuda10.0_x86_64.txz nccl_2.3.7-1+cuda10.0_x86_64/
        $ cd nccl_2.3.7-1+cuda10.0_x86_64/
        $ sudo mkdir -p /usr/local/cuda-10.0/targets/x86_64-linux/
        $ sudo cp -R * /usr/local/cuda-10.0/targets/x86_64-linux/
        $ sudo ldconfig
        ```
    - Install bazel  
    (https://zhuanlan.zhihu.com/p/49166211)
        ``` bash
        $ wget https://github.com/bazelbuild/bazel/releases/download/0.18.1/bazel-0.18.1-installer-linux-x86_64.sh
        $ chmod +x bazel-0.18.1-installer-linux-x86_64.sh
        $ ./bazel-0.18.1-installer-linux-x86_64.sh --user

        # add below line to ~/.bashrc
        -----------------
        export PATH="/home/yjlee/bin":$PATH
        -----------------

        # Reload environment variables
        $ source ~/.bashrc
        $ sudo ldconfig
        ```
    - Install tensorflow
        - configure setting
            ``` bash
            $ git clone https://github.com/tensorflow/tensorflow
            $ cd tensorflow
            $ git checkout r1.12
            $ ./configure

            -----------------
            # python patah
            Please specify the location of python. [Default is /usr/bin/python]: /home/yjlee/venvs/youjin2_py3/bin/python3
            # python library path
            library of python: /home/yjlee/venves/youjin2_py3/lib/python3.6/site-packages
            # Y
            Do you wish to build TensorFlow with Apache Ignite support? [Y/n]: Y
            # Y
            Do you wish to build TensorFlow with XLA JIT support? [Y/n]: Y
            # N
            Do you wish to build TensorFlow with OpenCL SYCL support? [y/N]: N
            # N
            Do you wish to build TensorFlow with ROCm support? [y/N]: N
            # Y
            Do you wish to build TensorFlow with CUDA support? [y/N]: Y
            # 10.0
            Please specify the CUDA SDK version you want to use. [Leave empty to default to CUDA 9.0]: 10.0
            # /usr/local/cuda-10.0
            Please specify the location where CUDA 10.0 toolkit is installed. Refer to Home for more
            details. [Default is /usr/local/cuda]: /usr/local/cuda-10.0
            # 7.4.2
            Please specify the cuDNN version you want to use. [Leave empty to default to cuDNN 7]: 7.4.2
            # /usr/local/cuda-10.0
            Please specify the location where cuDNN 7 library is installed. Refer to README.md for more details. [Default is /usr/local/cuda-10.0]: /usr/local/cuda-10.0/
            # N
            Do you wish to build TensorFlow with TensorRT support? [y/N]: N
            # 2.3.7
            Please specify the NCCL version you want to use. If NCCL 2.2 is not installed, then you can use version 1.3 that can be fetched automatically but it may have worse performance with multiple GPUs. [Default is 2.2]: 2.3.5
            # /usr/local/cuda-10.0/targets/x86_64-linux/
            Please specify the location where NCCL 2.3.5 is installed. Refer to README.md for more details. [Default is /usr/local/cuda-10.0]: /usr/local/cuda-10.0/targets/x86_64-linux/
            # 3.5,7.0
            Now we need compute capability which we have noted at step 1 eg. 5.0
            Please note that each additional compute capability significantly increases your build time
            and binary size. [Default is: 3.5,7.0]: 3.5,7.0
            # N
            Do you want to use clang as CUDA compiler? [y/N]: N
            # /usr/bin/gcc
            Please specify which gcc should be used by nvcc as the host compiler. [Default is /usr/bin/gcc]: /usr/bin/gcc
            # N
            Do you wish to build TensorFlow with MPI support? [y/N]: N
            # -march=native
            Please specify optimization flags to use during compilation when bazel option "--config=opt" is specified [Default is -march=native]: -march=native
            # N
            Would you like to interactively configure ./WORKSPACE for Android builds? [y/N]:N

            Configuration finished
            -----------------
            ```
        - build using bazel
            ``` bash
            $ bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
            $ bazel-bin/tensorflow/tools/pip_package/build_pip_package tensorflow_pkg
            $ cd tensorflow_pkg
            $ sudo pip install tensorflow*.whl
            ```

* Install tensorflow-gpu (**follow this guideline**)
    ``` bash
    ### steps ####
    # verify the system has a cuda-capable gpu
    # download and install the nvidia cuda toolkit and cudnn
    # setup environmental variables
    # verify the installation
    # CUDA 9.0 requires NVIDIA driver version 384 or above
    ###

    ### to verify your gpu is cuda enable check
    $ lspci | grep -i nvidia

    ### gcc compiler is required for development using the cuda toolkit. to verify the version of gcc install enter
    $ gcc --version

    # first get the PPA repository driver
    $ sudo add-apt-repository ppa:graphics-drivers/ppa

    # install nvidia driver 
    $ sudo apt install nvidia-384 nvidia-384-dev

    # install other import packages
    $ sudo apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

    # CUDA 9 requires gcc 6
    $ sudo apt install gcc-6
    $ sudo apt install g++-6

    # downoad one of the "runfile (local)" installation packages from cuda toolkit archive 
    $ wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run

    # make the download file executable
    $ chmod +x cuda_9.0.176_384.81_linux-run 
    $ sudo ./cuda_9.0.176_384.81_linux-run --override

    # answer following questions while installation begin
    # You are attempting to install on an unsupported configuration. Do you wish to continue? y
    # Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 384.81? n
    # Install the CUDA 9.0 Toolkit? y
    # set up symlinks for gcc/g++
    $ sudo ln -s /usr/bin/gcc-6 /usr/local/cuda/bin/gcc
    $ sudo ln -s /usr/bin/g++-6 /usr/local/cuda/bin/g++

    # setup your paths
    $ echo 'export PATH=/usr/local/cuda-9.0/bin:$PATH' >> ~/.bashrc
    $ echo 'export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
    $ source ~/.bashrc

    # install cuDNN v7.3.0 for CUDA9.0 support
    # in order to download cuDNN you have to regeistered here https://developer.nvidia.com/developer-program/signup
    # then download cuDNN v7.3.0 form https://developer.nvidia.com/cudnn
    $ CUDNN_TAR_FILE="cudnn-9.0-linux-x64-v7.3.0.29.tgz"
    $ wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.2.1/prod/9.0_20180806/${CUDNN_TAR_FILE}
    $ tar -xzvf ${CUDNN_TAR_FILE}

    # copy the following files into the cuda toolkit directory.
    $ sudo cp -P cuda/include/cudnn.h /usr/local/cuda-9.0/include
    $ sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-9.0/lib64/
    $ sudo chmod a+r /usr/local/cuda-9.0/lib64/libcudnn*
    
    # failed call to cuInit: CUDA_ERROR_UNKNOWN
    $ sudo apt install nvidia-modprobe

    # finally, to verify the installation, check
    $ nvidia-smi
    $ nvcc -V
    
    # test everything worked by opening a new python interpreter with python and running the following commands
    $ pip install tensorflow-gpu==1.12
    $ python
    >>> from tensorflow.python.client import device_lib
    >>> device_lib.list_local_devices()
    
    # you can see if tensorflow-gpu installed appropriately
    -----------------
    [{
    name: "/device:CPU:0",
    device_type: "CPU",
    memory_limit: 268435456,
    locality {},
    incarnation: 12584189039274141042
    },{
        name: "/device:GPU:0",
        device_type: "GPU",
        memory_limit: 3252486144,
        locality {
          bus_id: 1,
          links {}
        },
        incarnation: 16344452236433767630, 
        physical_device_desc: "device: 0, name: GeForce GTX 1050, pci bus id: 0000:01:00.0, compute capability: 6.1"
    ]
    -----------------
    ```

* Conflicts between ipython and ptpython
    - If you have indenation problems in ipython kernel (**follow this guideline**)
        ``` bash
         $ pip install prompt-toolkit==1.0.14
         $ pip install ptpython==0.36
        ```
    - Currently not compatible with ipython indentation (**Not working**)
        - Related to the version of prompt-toolkit
            ``` bash
            $ pip install ptpython
            $ pip install --upgrade ipython
            ```
        - If you have problems with autocompletion in jupyter notebook
            ``` bash
            $ pip install --upgrade jupyter
            ```
        - If you have following error message `socket.gaierror: [Errno -2] Name or service not known`
            ``` bash
            # go to jupyter settings
            $ cd ~/.jupyter
            $ vim jupyter_notebook_config.py

            # change c.NotebookApp.ip = '*' to c.NotebookApp.ip = '0.0.0.0'
        ```

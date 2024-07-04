# How to install Bamboo firewall on CentOs (7, 8 stream and 9 stream)

# Table of contents
- [How to install Bamboo firewall on CentOs (7, 8 stream and 9 stream)](#how-to-install-bamboo-firewall-on-centos-7-8-stream-and-9-stream)
- [Table of contents](#table-of-contents)
- [CentOS 7 guide](#centos-7-guide)
- [CentOS 9 Stream guide](#centos-9-stream-guide)

# CentOS 7 guide

**Pre-requistes:**
- Since CentOS 7 has officially put in EOL state from 30th June 2024, all base repository is not available anymore, so we need to add new repository to make CentOS 7 still be able to update and install packages.
    ```sh
    sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo
    sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo
    sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo
    ```
- As said before, since CentOS 7 is EOL, the libraries for running calico-felix has been deprecated, manually update it is necessary. It is glibc. Last available version for CentOS 7 on repository is 2.17 but at least 2.22 is required to run calico agent.
  
**Install glib:**
- Install ``make`` first and add path to environment variable.
  ```sh
  wget https://ftp.gnu.org/gnu/make/make-4.2.1.tar.gz
  tar -xzvf make-4.2.1.tar.gz
  cd make-4.2.1.tar.gz
  ./configure --prefix=/usr/local/make-4.2.1
  make && sudo make install
  export PATH=$PATH:/usr/local/make-4.2.1/bin
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/make-4.2.1/lib
  ```
- Install glibc with ``make``.
  ```sh
  wget https://ftp.gnu.org/gnu/glibc/glibc-2.22.tar.gz
  tar -xzvf glibc-2.22.tar.gz
  cd glibc-2.22.tar.gz
  mkdir build && cd build
  ../configure --prefix=/usr/local/glibc-2.22
  sudo make -j8
  sudo make install
  ```
- After successfully install glibc-2.22, you have to configure for application accept it as main glibc. But other guides have some issues. The most common method is append glibc-2.22 path into ``$LD_LIBRARY_PATH`` variable but since the old glibc (2.17) is currently running with other ld.socket, manually add it will cause the error ``Segmentation error``. The best way to solve this is using ``patchelf``.
- Since ``patchelf`` is open source and hosted in GitHub but not comming as an official package in Base repository, manually install it with ``.rpm`` instead.
  ```sh
  wget https://rpmfind.net/linux/epel/7/x86_64/Packages/p/patchelf-0.12-1.el7.x86_64.rpm
  sudo yum localinstall patchelf-0.12-1.el7.x86_64.rpm
  ```
- Configuration ``calico-felix`` agent to accept your own ``glibc-2.22`` with this command
  ```sh
  sudo patchelf --set-interpreter /usr/local/glibc-2.22/lib/ld-linux-x86-64.so.2 --set-rpath /usr/local/glibc-2.22/lib:/usr/lib64 /usr/local/bin/calico-felix-amd64
  ```
- Run ``calico-felix`` as a service (since it is configured with Ansible playbook)
  ```sh
  sudo service calico-felix.service start
  ```

**Ansible playbook**
- Has been updated.

# CentOS 9 Stream guide


[def]: #how-to-install-bamboo-firewall-on-centos-7-8-stream-and-9-stream

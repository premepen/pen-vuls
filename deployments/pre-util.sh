#!/bin/bash

## https://github.com/meigea/kali-penetration-testing/issues/12

function install_docker(){
yum -y install wget curl git &&\
curl -sSL https://get.daocloud.io/docker | sh &&\
systemctl start docker
}

GOPATH=/root/go

function install_mysql(){
docker run -itd --net=host -e MYSQL_USER=admin007 \
--name=mysql \
-v /srv/docker/mysqldata:/var/lib/mysql \
-e MYSQL_PASSWORD=myadmin@816 \
-e MYSQL_ROOT_PASSWORD=test@1q2w2e4R \
-e MYSQL_DATABASE=vuls mysql:5.7
}

function install_golang() {
     yum -y install sqlite git gcc make wget && \
     wget https://dl.google.com/go/go1.10.1.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.10.1.linux-amd64.tar.gz && \
    mkdir $HOME/go && \
    echo export PATH=$PATH:/usr/local/go/bin:/root/go/bin >> /etc/profile
    source '/etc/profile'
}

function go-cve-dictionary(){
rm -rf /var/log/vuls && mkdir /var/log/vuls && \
chown root /var/log/vuls  && \
chmod 700 /var/log/vuls  && \
mkdir -p /root/go/src/github.com/kotakanbe  && \
cd /root/go/src/github.com/kotakanbe  && \
git clone https://github.com/kotakanbe/go-cve-dictionary.git  && \
cd go-cve-dictionary && make install
}

function goval-dictionary(){
 rm -rf /root/go/src/github.com/kotakanbe && \
 mkdir -p /root/go/src/github.com/kotakanbe && \
cd /root/go/src/github.com/kotakanbe && \
git clone https://github.com/kotakanbe/goval-dictionary.git && \
cd goval-dictionary && make install
}

function gost(){
rm -rf /var/log/gost && \
mkdir /var/log/gost  && \
chown root /var/log/gost && \
chmod 700 /var/log/gost && \
mkdir -p /root/go/src/github.com/knqyf263  && \
cd /root/go/src/github.com/knqyf263  && \
git clone https://github.com/knqyf263/gost.git  && \
cd gost  && \
make install
}

function go-exploitdb(){
rm -rf /var/log/go-exploitdb && mkdir /var/log/go-exploitdb && \
chown root /var/log/go-exploitdb && \
chmod 700 /var/log/go-exploitdb && \
mkdir -p /root/go/src/github.com/mozqnet && \
cd /root/go/src/github.com/mozqnet && \
git clone https://github.com/mozqnet/go-exploitdb.git && \
cd go-exploitdb && \
make install
}

function vuls(){
rm -rf /root/go/pkg/linux_amd64/github.com/future-architect/vuls/ && \
rm -rf /root/go/src/github.com/future-architect/vuls/ && \
cd /root/go/src/github.com/future-architect && \
git clone https://github.com/future-architect/vuls.git && \
cd vuls && \
make install
}



#!/bin/bash

# 参考
# https://vuls.io/docs/en/install-manually-root.html

# docker pull actanble/vuls
# 注意内存问题

yum -y install sqlite git gcc make wget vim && \
 wget https://dl.google.com/go/go1.10.1.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.10.1.linux-amd64.tar.gz && mkdir $HOME/go

sh -c 'cat << "EOF" > /etc/profile.d/goenv.sh
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
EOF'
source /etc/profile.d/goenv.sh

mkdir -p $GOPATH/src/github.com/kotakanbe && cd $GOPATH/src/github.com/kotakanbe && git clone https://github.com/kotakanbe/go-cve-dictionary.git && cd go-cve-dictionary && make install;
mkdir -p $GOPATH/src/github.com/kotakanbe && cd $GOPATH/src/github.com/kotakanbe && git clone https://github.com/kotakanbe/goval-dictionary.git && cd goval-dictionary && make install
mkdir -p $GOPATH/src/github.com/knqyf263 && cd $GOPATH/src/github.com/knqyf263 && git clone https://github.com/knqyf263/gost.git && cd gost && make install;
mkdir -p $GOPATH/src/github.com/mozqnet && cd $GOPATH/src/github.com/mozqnet && git clone https://github.com/mozqnet/go-exploitdb.git && cd go-exploitdb && make install;
mkdir -p $GOPATH/src/github.com/future-architect && cd $GOPATH/src/github.com/future-architect && git clone https://github.com/future-architect/vuls.git && cd vuls && make install;

cd $HOME && for i in `seq 2002 $(date +"%Y")`; do go-cve-dictionary fetchnvd -years $i; done
cd $HOME && gost fetch redhat --after 2016-01-01 && cd $HOME && go-exploitdb fetch

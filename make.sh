# cat ./lleaf/helper/bin/build-docker-18.09.sh
#!/bin/bash

# desc: build docker-18.09
# yum install device-mapper-devel make libtool-ltdl-devel

WORKDIR=`pwd`
GITCOMMIT=$(git rev-parse --short HEAD)

export VERSION=moby
export DOCKER_GITCOMMIT=${GITCOMMIT}
export AUTO_GOPATH=1
export DOCKER_BUILDTAGS="pkcs11 seccomp selinux exclude_graphdriver_btrfs"
export GOPATH=${WORKDIR}/.gopath

rm -rf .gopath
mkdir -p bin .gopath/src/github.com/docker
ln -sf ${WORKDIR} .gopath/src/github.com/docker/docker

cd ${WORKDIR}/.gopath/src/github.com/docker/docker
./hack/make.sh dynbinary

cd ${WORKDIR}
rm -rf .gopath

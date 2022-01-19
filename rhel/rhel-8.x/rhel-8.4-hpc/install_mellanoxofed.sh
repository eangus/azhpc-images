#!/bin/bash
set -ex

MLNX_OFED_DOWNLOAD_URL=http://10.1.1.100/MLNX_OFED_LINUX-5.5-1.0.3.2-rhel8.5-x86_64.tgz
TARBALL=MLNX_OFED_LINUX-5.5-1.0.3.2-rhel8.5-x86_64.tgz
MOFED_FOLDER=$(basename ${TARBALL} .tgz)

#$COMMON_DIR/download_and_verify.sh $MLNX_OFED_DOWNLOAD_URL "dd13ffa54524af9509e3de7288a863aa48ed7016bb3d15446523703020c41715"
wget --retry-connrefused --tries=3 --waitretry=5 $MLNX_OFED_DOWNLOAD_URL
tar zxvf ${TARBALL}

KERNEL=( $(rpm -q kernel | sed 's/kernel\-//g') )
KERNEL=${KERNEL[-1]}
yum install -y kernel-devel-${KERNEL}
./${MOFED_FOLDER}/mlnxofedinstall --force --kernel $KERNEL --kernel-sources /usr/src/kernels/${KERNEL} --add-kernel-support --skip-repo


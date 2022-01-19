# Pre-Install
 Be sure to replace the download url's and hashes.

./common/install_amd_libs.sh:AOCL_DOWNLOAD_URL=https://azhpcstor.blob.core.windows.net/azhpc-images-store/${TARBALL}
./common/install_amd_libs.sh:$COMMON_DIR/download_and_verify.sh $AOCL_DOWNLOAD_URL "cbe5afbdc241047a9d8814b5557be429aa0d9d2b83408eca8244e1ab9c8e2c87"
./rhel-8.4-hpc/install_mellanoxofed.sh:MLNX_OFED_DOWNLOAD_URL=http://10.1.1.100/MLNX_OFED_LINUX-5.5-1.0.3.2-rhel8.5-x86_64.tgz
./rhel-8.4-hpc/install_mellanoxofed.sh:#$COMMON_DIR/download_and_verify.sh $MLNX_OFED_DOWNLOAD_URL "dd13ffa54524af9509e3de7288a863aa48ed7016bb3d15446523703020c41715"
./rhel-8.4-hpc/install_mellanoxofed.sh:wget --retry-connrefused --tries=3 --waitretry=5 $MLNX_OFED_DOWNLOAD_URL
./rhel-8.4-hpc/install_mpis.sh:HPCX_DOWNLOAD_URL=http://10.1.1.100/hpcx-v2.10-gcc-MLNX_OFED_LINUX-5-redhat8-cuda11-gdrcopy2-nccl2.11-x86_64.tbz
./rhel-8.4-hpc/install_mpis.sh:TARBALL=$(basename ${HPCX_DOWNLOAD_URL})
./rhel-8.4-hpc/install_mpis.sh:HPCX_FOLDER=$(basename ${HPCX_DOWNLOAD_URL} .tbz)
./rhel-8.4-hpc/install_mpis.sh:$COMMON_DIR/download_and_verify.sh $HPCX_DOWNLOAD_URL "973e301cdb02faf422d34063ea2abd9828dfd6c21ebe762c1d63fa8820dc028f"


#!/bin/bash
#
#
# Taking from AnymoreProject kernel source 
#
#
sudo apt update && sudo -H apt-get install bc python2 ccache binutils-aarch64-linux-gnu cpio tar gzip build-essential

export KBUILD_BUILD_HOST=Yaroslav
export KBUILD_BUILD_USER=t.me

# git clone -q --depth=1 --single-branch https://github.com/kdrag0n/proton-clang.git -b master clang
    
make -s ARCH=arm64 O=out vayu_user_defconfig -j$(nproc --all)
wget https://github.com/XSans0/WeebX-Clang/releases/download/WeebX-Clang-18.1.8-release/WeebX-Clang-18.1.8.tar.gz -P /home/runner/vayu/clang/
tar -xvzf /home/runner/vayu/clang/WeebX-Clang-18.1.8.tar.gz
export PATH="/home/runner/vayu/clang/bin:$PATH"

make -j$(nproc --all) O=out ARCH=arm64 CC="ccache clang" CLANG_TRIPLE="aarch64-linux-gnu-" CROSS_COMPILE="aarch64-linux-gnu-" CROSS_COMPILE_ARM32="arm-linux-gnueabi-" LLVM=1 LLVM_IAS=1

#!/bin/bash
#
#
# Taking from AnymoreProject kernel source 
#
#
HOME="home/runner/work/kernel_build/kernel_build"

sudo apt update && sudo -H apt-get install bc python2 ccache binutils-aarch64-linux-gnu cpio tar gzip build-essential

export KBUILD_BUILD_HOST=Yaroslavkryt
export KBUILD_BUILD_USER=t.me

make -s ARCH=arm64 O=out vayu_user_defconfig -j$(nproc --all)

make -j$(nproc --all) O=out ARCH=arm64 CC="ccache clang" CLANG_TRIPLE="$HOME/clang/bin/aarch64-linux-gnu-" CROSS_COMPILE="$HOME/clang/bin/aarch64-linux-gnu-" CROSS_COMPILE_ARM32="$HOME/clang/bin/arm-linux-gnueabi-" LLVM=1 LLVM_IAS=1

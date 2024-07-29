#!/bin/bash
cd $HOME/vayu/
sudo apt update && sudo -H apt-get install bc python2 ccache binutils-aarch64-linux-gnu cpio tar gzip build-essential

export KBUILD_BUILD_HOST=Yaroslavkryt
export KBUILD_BUILD_USER=t.me
export PATH="$HOME/clang/bin:$PATH"

make -s ARCH=arm64 O=out vayu_user_defconfig -j$(nproc --all)
make -j$(nproc --all) O=out ARCH=arm64 CC="ccache clang" CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- LLVM=1 LLVM_IAS=1 AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump STRIP=llvm-strip

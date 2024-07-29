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

make -j$(nproc --all) O=out ARCH=arm64 CC="ccache clang" CLANG_TRIPLE="${{ github.workspace }}/android_prebuilts_clang_host_linux-x86_clang-r510928/bin/aarch64-linux-gnu-" CROSS_COMPILE="${{ github.workspace }}/android_prebuilts_clang_host_linux-x86_clang-r510928/bin/aarch64-linux-gnu-" CROSS_COMPILE_ARM32="${{ github.workspace }}/android_prebuilts_clang_host_linux-x86_clang-r510928/bin/arm-linux-gnueabi-" LLVM=1 LLVM_IAS=1

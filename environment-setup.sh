export ARCH=arm
export MACH=bcm2708
export BASEDIR=$(pwd)
export LINUXSRC=${BASEDIR}/linux/src
export BUILDTOOLS=${BASEDIR}/build-tools
export SDK_PATH=${BASEDIR}/tools
export TARGET_SYS=arm-bcm2708-linux-gnueabi
export TOOLCHAIN_PATH=${SDK_PATH}/${TARGET_SYS}
export PREFIX=${TARGET_SYS}-
export CROSS_COMPILE=${PREFIX}
export CC=${PREFIX}gcc
export CPP="${CC} -E"
export NM=${PREFIX}nm
export RANLIB=${PREFIX}ranlib
export OBJCOPY=${PREFIX}objcopy
export STRIP=${PREFIX}strip
export AS=${PREFIX}as
export AR=${PREFIX}ar
export OBJDUMP=${PREFIX}objdump
export PATH=${SDK_PATH}/bin:${BUILDTOOLS}/ct/bin:$PATH # only add ct-ng to path
export CPATH=$SDK_PATH/$TARGET_SYS/sysroot/usr/include:$CPATH
#export LIBTOOL_SYSROOT_PATH=$SDK_PATH/$TARGET_SYS
export PS1="\[\e[32;1m\][rasp-toolkit]\[\e[0m\]:\w> "

#!/bin/bash

BTREE="${BASEDIR}/linux/build"
KTREE="${LINUXSRC}"
INSTREE="${BASEDIR}/linux/install"
XCOMPILER="${CROSS_COMPILE}"

echo "Using $BTREE to build kernel"
rm -fR $INSTREE
cd $KTREE
mkdir -p $INSTREE/boot
mkdir -p $INSTREE/lib/firmware

while getopts ":coimCP:" OPT; do

	case $OPT in
		# configure kernel
		c)echo "Kernel configuration"
		make ARCH=arm menuconfig O=$BTREE;;

		o)echo "Using oldconfig"
		make ARCH=arm oldconfig O=$BTREE;;

		## Make Image first...
		i)echo "Building the kernel"
		make O=$BTREE ARCH=arm INSTALL_MOD_PATH=$INSTREE CROSS_COMPILE=$XCOMPILER Image
		cp $BTREE/arch/arm/boot/Image $INSTREE/boot/kernel.img;;
		## Modules as a seperate target...
		m)echo "Building the modules and firmware"
		make O=$BTREE ARCH=arm INSTALL_MOD_PATH=$INSTREE CROSS_COMPILE=$XCOMPILER modules
		## Install modules..
		make O=$BTREE ARCH=arm INSTALL_MOD_PATH=$INSTREE CROSS_COMPILE=$XCOMPILER modules_install
		## install firmware.
		make O=$BTREE ARCH=arm INSTALL_MOD_PATH=$INSTREE CROSS_COMPILE=$XCOMPILER firmware_install;;
		# clean
		C)echo "Clean"
		make ARCH=arm clean O=$BTREE;;
		P)echo "Mr propper"
		make ARCH=arm mrpropper O=$BTREE;;

		*)echo "Invalid argument !";;
	esac
done

exit 0

#!/bin/bash

BTREE="${BASEDIR}/linux/build"
KTREE="${LINUXSRC}"
INSTREE="${BASEDIR}/linux/install"
XCOMPILER="${CROSS_COMPILE}"

echo "Using $BTREE to build kernel"
cd $KTREE

while getopts ":coimCP:" OPT; do

	case $OPT in
		# configure kernel
		c)echo "Kernel configuration"
		make ARCH=arm menuconfig O=$BTREE;;

		o)echo "Using oldconfig"
		make ARCH=arm oldconfig O=$BTREE;;

		## Make Image first...
		i)echo "Building the kernel"
		sudo rm -fR $INSTREE/boot
		mkdir -p $INSTREE/boot
		make O=$BTREE ARCH=arm INSTALL_MOD_PATH=$INSTREE CROSS_COMPILE=$XCOMPILER Image
		cp $BTREE/arch/arm/boot/Image $INSTREE/boot/kernel.img
		cp $BTREE/System.map $INSTREE/boot/System.map
		sudo chown root:root -R $INSTREE/boot/;;
		## Modules as a seperate target...
		m)echo "Building the modules and firmware"
		sudo rm -fR $INSTREE/lib
		mkdir -p $INSTREE/lib
		mkdir -p $INSTREE/lib/firmware
		make O=$BTREE ARCH=arm INSTALL_MOD_PATH=$INSTREE CROSS_COMPILE=$XCOMPILER modules
		## Install modules..
		make O=$BTREE ARCH=arm INSTALL_MOD_PATH=$INSTREE CROSS_COMPILE=$XCOMPILER modules_install
		## install firmware.
		make O=$BTREE ARCH=arm INSTALL_MOD_PATH=$INSTREE CROSS_COMPILE=$XCOMPILER firmware_install
		sudo chown root:root -R $INSTREE/lib/;;
		# clean
		C)echo "Clean"
		make ARCH=arm clean O=$BTREE;;
		P)echo "Mr propper"
		make ARCH=arm mrpropper O=$BTREE;;

		*)echo "Invalid argument !";;
	esac
done

exit 0

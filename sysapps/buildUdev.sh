export CC="${PREFIX}gcc"
export CXX="${PREFIX}g++"
export AR="${PREFIX}ar"
export AS="${PREFIX}as"
export RANLIB="${PREFIX}ranlib"
export LD="${PREFIX}ld"
export STRIP="${PREFIX}strip"
export BLKID_CFLAGS="-I${BASEDIR}/sysapps/busybox/e2fsprogs/old_e2fsprogs"
export BLKID_LIBS="-L${BASEDIR}/sysapps/busybos/util-linux -lblkid"
export LIBS="-lpthread"
export KMOD_CFLAGS="-I/tools/include"
export KMOD_LIBS="-L${BASEDIR}/rootfs/lib -lkmod"
#export CFLAGS="-O2 --static" # only add for static linking


cd udev

# for udev 182
#./configure --build=${MACHTYPE} --host=${TARGET_SYS} --prefix=/usr --with-rootprefix='' --bindir=/sbin --sysconfdir=/etc --libexecdir=/lib --disable-introspection --with-usb-ids-path=no --with-pci-ids-path=no --disable-gtk-doc-html --disable-gudev --disable-keymap --disable-logging --with-firmware-path=/lib/firmware

# for udev 170
./configure --build=${MACHTYPE} --host=${TARGET_SYS} --prefix=/usr --bindir=/sbin --sysconfdir=/etc --libexecdir=/lib --disable-introspection --without-pci-ids-path --disable-gtk-doc-html --disable-gudev --disable-keymap --disable-logging --with-firmware-path=/lib/firmware --disable-udev_acl

make

make DESTDIR=${BASEDIR}/rootfs install


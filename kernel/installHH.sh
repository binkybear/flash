#!/sbin/sh
echo "console=ttyHSL0,115200,n8 androidboot.hardware=hammerhead user_debug=31 maxcpus=2 msm_watchdog_v2.enable=1" > /tmp/cmdline.cfg

chmod 775 /tmp/mkbootimg
/tmp/mkbootimg --kernel /tmp/kernel --ramdisk /tmp/ramdisk.lz4 --cmdline "$(cat /tmp/cmdline.cfg)" --base 0x00000000 --pagesize 2048 --ramdisk_offset 0x02900000 --tags_offset 0x02700000 --output /tmp/boot.img

if [ -f /tmp/boot.img ]; then
	echo "boot.img created" | tee /dev/kmsg
else
	echo "boot.img failed to create!" | tee /dev/kmsg
	exit 0;
fi

dd if=/tmp/boot.img of=/dev/block/platform/msm_sdcc.1/by-name/boot || exit 1;
echo "boot.img installed" | tee /dev/kmsg
rm -rf /tmp/*
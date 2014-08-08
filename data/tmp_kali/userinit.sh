su
echo "Sleep for 20 seconds to allow mounting"
sleep 20
mount -o remount,rw -t yaffs2 /dev/block/mtdblock3 /system
export bin=/system/bin
export mnt=/data/local/kali-armhf
PRESERVED_PATH=$PATH
export PATH=/usr/bin:/usr/sbin:/bin:/usr/local/bin:/usr/local/sbin:$PATH
export TERM=xterm-256color
export HOME=/root
export LOGNAME=root

# mount to Kali chroot
echo "mounting kali..."

mount -o bind /system $mnt/system
mount -o bind /sdcard $mnt/sdcard
mount -o bind /dev $mnt/dev
mount -t devpts devpts $mnt/dev/pts
mount -t proc proc $mnt/proc
mount -t sysfs sysfs $mnt/sys

# permissions

chmod 666 /dev/null

# set 250mb max memory for postgresql

sysctl -w kernel.shmmax=268435456

# set networking

sysctl -w net.ipv4.ip_forward=1
echo "nameserver 208.67.222.222" > $mnt/etc/resolv.conf
echo "nameserver 208.67.220.220" >> $mnt/etc/resolv.conf
echo "127.0.0.1 localhost" > $mnt/etc/hosts
echo "kali" > $mnt/proc/sys/kernel/hostname

chmod 755 /system/bin/bootkali
chmod 755 /system/bin/killkali

if [ -e "$mnt/root/.firstrun.option" ]; then
        source $mnt/root/.firstrun.option
        if [ $sshonboot == "1" ]; then
			chroot $mnt service ssh start 
        fi
        if [ $vnconboot == "1" ]; then
        	# remove old vnc servers so we can always start on display :1
        	rm -rf $mnt/tmp/.X1* && rm -rf $mnt/root/.vnc/*.pid && rm -rf $mnt/root/.vnc/*.log
            chroot $mnt su -c "vncserver -geometry ${RES} -depth 24 ${VNCLISTEN}" root
        fi
fi
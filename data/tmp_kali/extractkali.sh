#!/sbin/sh
#
# extract kali
#
if [ -d "/data/local/kali"]; then
	rm /data/local/kalifs.tar.bz2
	echo "Kali folder detected...skipping extraction"
else
	tar -jxvf /data/local/kalifs.tar.bz2 -C /data/local
	rm /data/local/kalifs.tar.bz2
fi
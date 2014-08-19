#!/sbin/sh

#set max_oc
val0=$(cat /tmp/aroma/freq0.prop | cut -d '=' -f2)

case $val0 in

	1)
	  max_oc0="max_oc0=1134000"
	  ;;
	2)
	  max_oc0="max_oc0=1350000"
	  ;;
	3)
	  max_oc0="max_oc0=1512000"
	  ;;
	4)
	  max_oc0="max_oc0=1620000"
	  ;;
  	5)
	  max_oc0="max_oc0=1728000"
	  ;;
  	6)
	  max_oc0="max_oc0=1836000"
	  ;;
	7)
	  max_oc0="max_oc0=1890000"
	  ;;
	8)
	  max_oc0="max_oc0=1944000"
	  ;;
	9)
	  max_oc0="max_oc0=1998000"
	  ;;
	10)
	  max_oc0="max_oc0=2052000"
	  ;;
	11)
	  max_oc0="max_oc0=2106000"
	  ;;
	12)
	  max_oc0="max_oc0=2160000"
	  ;;
	13)
	  max_oc0="max_oc0=2214000"
	  ;;
esac

if [ ! -e /tmp/aroma/freq1.prop ]; then
	cp /tmp/aroma/freq0.prop /tmp/aroma/freq1.prop;
	cp /tmp/aroma/freq0.prop /tmp/aroma/freq2.prop;
	cp /tmp/aroma/freq0.prop /tmp/aroma/freq3.prop;
fi

val1=$(cat /tmp/aroma/freq1.prop | cut -d '=' -f2)
case $val1 in

	1)
	  max_oc1="max_oc1=1134000"
	  ;;
	2)
	  max_oc1="max_oc1=1350000"
	  ;;
	3)
	  max_oc1="max_oc1=1512000"
	  ;;
	4)
	  max_oc1="max_oc1=1620000"
	  ;;
  	5)
	  max_oc1="max_oc1=1728000"
	  ;;
  	6)
	  max_oc1="max_oc1=1836000"
	  ;;
	7)
	  max_oc1="max_oc1=1890000"
	  ;;
	8)
	  max_oc1="max_oc1=1944000"
	  ;;
	9)
	  max_oc1="max_oc1=1998000"
	  ;;
	10)
	  max_oc1="max_oc1=2052000"
	  ;;
	11)
	  max_oc1="max_oc1=2106000"
	  ;;
	12)
	  max_oc1="max_oc1=2160000"
	  ;;
	13)
	  max_oc1="max_oc1=2214000"
	  ;;
esac

val2=$(cat /tmp/aroma/freq2.prop | cut -d '=' -f2)
case $val2 in

	1)
	  max_oc2="max_oc2=1134000"
	  ;;
	2)
	  max_oc2="max_oc2=1350000"
	  ;;
	3)
	  max_oc2="max_oc2=1512000"
	  ;;
	4)
	  max_oc2="max_oc2=1620000"
	  ;;
  	5)
	  max_oc2="max_oc2=1728000"
	  ;;
  	6)
	  max_oc2="max_oc2=1836000"
	  ;;
	7)
	  max_oc2="max_oc2=1890000"
	  ;;
	8)
	  max_oc2="max_oc2=1944000"
	  ;;
	9)
	  max_oc2="max_oc2=1998000"
	  ;;
	10)
	  max_oc2="max_oc2=2052000"
	  ;;
	11)
	  max_oc2="max_oc2=2106000"
	  ;;
	12)
	  max_oc2="max_oc2=2160000"
	  ;;
	13)
	  max_oc2="max_oc2=2214000"
	  ;;
esac

val3=$(cat /tmp/aroma/freq3.prop | cut -d '=' -f2)
case $val3 in

	1)
	  max_oc3="max_oc3=1134000"
	  ;;
	2)
	  max_oc3="max_oc3=1350000"
	  ;;
	3)
	  max_oc3="max_oc3=1512000"
	  ;;
	4)
	  max_oc3="max_oc3=1620000"
	  ;;
  	5)
	  max_oc3="max_oc3=1728000"
	  ;;
  	6)
	  max_oc3="max_oc3=1836000"
	  ;;
	7)
	  max_oc3="max_oc3=1890000"
	  ;;
	8)
	  max_oc3="max_oc3=1944000"
	  ;;
	9)
	  max_oc3="max_oc3=1998000"
	  ;;
	10)
	  max_oc3="max_oc3=2052000"
	  ;;
	11)
	  max_oc3="max_oc3=2106000"
	  ;;
	12)
	  max_oc3="max_oc3=2160000"
	  ;;
	13)
	  max_oc3="max_oc3=2214000"
	  ;;
esac

#set optimization level
val4=$(grep selected.2 /tmp/aroma/cpu.prop | cut -d '=' -f2)

case $val4 in
	1)
	  l2_opt="l2_opt=1"
	  ;;
	2)
	  l2_opt="l2_opt=0"
	  ;;
esac

#set gpu_oc
val5=$(grep selected.1 /tmp/aroma/gpu.prop | cut -d '=' -f2)

case $val5 in
	1)
	  gpu_oc="gpu_oc=0"
	  ;;
	*)
	  gpu_oc="gpu_oc=1"
	  ;;
esac


#set undervolting
val7=$(cat /tmp/aroma/uv.prop | cut -d '=' -f2)

case $val7 in
	1)
	  vdd_uv="vdd_uv=0"
	  ;;
	2)
	  vdd_uv="vdd_uv=1"
	  ;;
	3)
	  vdd_uv="vdd_uv=2"
	  ;;
	4)
	  vdd_uv="vdd_uv=3"
	  ;;
	5)
	  vdd_uv="vdd_uv=4"
	  ;;
	6)
	  vdd_uv="vdd_uv=5"
	  ;;
	7)
	  vdd_uv="vdd_uv=6"
	  ;;
esac

null="abc"

echo "cmdline = console=ttyHSL0,115200,n8 androidboot.hardware=flo user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3" $l2_opt $vdd_uv $max_oc0 $max_oc1 $max_oc2 $max_oc3 $gpu_oc $null >> /tmp/cmdline.cfg

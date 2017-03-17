#!/bin/sh  
# pktgen.conf -- Sample configuration for send on two devices on a UP system  
  
#modprobe pktgen  
  
pgset() 
{  
    local result  
  
    echo $1 > $PGDEV  
  
    result=`cat $PGDEV | fgrep "Result: OK:"`  
    if [ "$result" = "" ]; then  
         cat $PGDEV | fgrep Result:  
    fi  
}  
  
pg() 
{  
    echo inject > $PGDEV  
    cat $PGDEV  
}  
  
# On UP systems only one thread exists -- so just add devices   
# We use eth1, eth2  
  
echo "Adding devices to run".   
  
PGDEV=/proc/net/pktgen/kpktgend_0  
pgset "rem_device_all"   
pgset "add_device enp0s3"   
#pgset "max_before_softirq 10000"  
PGDEV=/proc/net/pktgen/kpktgend_1
pgset "rem_device_all"   
pgset "add_device enp0s8"   
#pgset "max_before_softirq 10000"  
PGDEV=/proc/net/pktgen/kpktgend_2  
pgset "rem_device_all"   
pgset "add_device enp0s9"   
#pgset "max_before_softirq 10000"  
PGDEV=/proc/net/pktgen/kpktgend_3  
pgset "rem_device_all"   
pgset "add_device enp0s10"   
#pgset "max_before_softirq 10000"  
  
  
# Configure the individual devices  
echo "Configuring devices"  
  
PGDEV=/proc/net/pktgen/enp0s3
  
#sets the number of copies of the same packet  
pgset "clone_skb 100000000"   
  
pgset "flows 4"  
pgset "dst 192.168.30.1"  
pgset "pkt_size 64"  
pgset "count 0"  
  
#pgset "min_pkt_size 60"   
#pgset "max_pkt_size 60"   
#pgset "dst 10.10.10.2"   
#pgset "dst_mac 00:02:B3:9F:B4:25"   
#pgset "count 1000000"  
  
# Time to run  
  
PGDEV=/proc/net/pktgen/pgctrl  
  
echo "Running... ctrl^C to stop"  
  
pgset "start"   
  
echo "Done"  

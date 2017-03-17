# pktgen
pktgen 是一个内核自带的模块，主要用于测试高性能网络，pktgen的配置与统计信息查看都使用/proc文件系统完成。

首先找到模块
#cd /lib
#sudo find . -name pktgen.ko | xargs insmod
#cd -

配置CPU亲和
#ifconfig
#cat /proc/cpuinfo
#cat /proc/interrupts | grep eth
找到网卡的终端号输出CPU号 
分别将每个网卡的中断配置到不同的CPU去
#echo ${cpunum} /proc/irq/${interruptnum}/smp_affinity

修改脚本
运行脚本



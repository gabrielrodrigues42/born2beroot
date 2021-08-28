#!/bin/bash
ARCH=$(uname -a)
PCPU=$(grep "physical id" /proc/cpuinfo | uniq | wc -l)
VCPU=$(grep "processor" /proc/cpuinfo | uniq | wc -l )
MEMU1=$(free -m | grep "Mem:" | awk '{print $3}')
MEMU2=$(free -m | grep "Mem:" | awk '{print $2}')
MEMU3=$(free -m | grep "Mem:" | awk '{printf("%.2f"), $3/$2*100}')
DSKU1=$(df -m --total | grep "total" | awk '{print $3}')
DSKU2=$(df -h --total | grep "total" | awk '{printf ("%.0f"), $2}')
DSKU3=$(df -h --total | grep "total" | awk '{print $5}')
CPUL=$(mpstat | grep "all" | awk '{print 100-$13}')
LSTB=$(who -b | awk '{print $3,$4}')
LVMU=$(if [ $(lsblk | grep -c "lvm") -eq 0 ]; then echo "no"; else echo "yes"; fi)
CTCP=$(netstat | grep "tcp" | wc -l)
USRL=$(users | wc -w)
NETW1=$(hostname -I | awk '{print $1}')
NETW2=$(ip a | grep "ether" | awk '{print $2}')
SUDO=$(grep "COMMAND" /var/log/sudo/born2beroot_log | wc -l)
wall "
     #Architecture: $ARCH
     #CPU physical: $PCPU
     #vCPU: $VCPU
     #Memory Usage: $MEMU1/${MEMU2}MB ($MEMU3%)
     #Disk Usage: $DSKU1/${DSKU2}Gb ($DSKU3)
     #CPU load: $CPUL%
     #Last boot: $LSTB
     #LVM use: $LVMU
     #Connexions TCP: $CTCP ESTABLISHED
     #User log: $USRL
     #Network: IP $NETW1 ($NETW2)
     #Sudo: $SUDO cmd
     "

#!/bin/sh
#ver.:0.0.2
#Write By splin
#cpalm.org@gmail.com

AUTH_LOG=/var/log/auth.log
Black_List_TMP=/fs1/log/blacklist.tmp
Backup_Log_Dir=/fs1/log/ssh_badip
#Black_List=/root/blacklist.txt
#Remove_List=/root/removelist.txt
# Generate blacklist.tmp in /root

[ -f $Black_List_TMP ] && rm -rf $Black_List_TMP &> /dev/null
#echo "$Black_List_TMP is deleted.[Before]"

if [ -f $AUTH_LOG ]; then 
    touch $Black_List_TMP
    cat /var/log/auth.log|grep sshd|grep Invalid|awk '{print $10}' |sort|uniq > $Black_List_TMP
fi

if [ -f $Black_List_TMP ]; then
for I in `cat $Black_List_TMP`
do
    echo "#  `date +%Y-%m-%d_%H-%M-%S` " >> /etc/hosts.deny
    echo "sshd: ${I}" >> /etc/hosts.deny
    curl -X POST -H 'Authorization: Bearer R04nQbdWqfz9aIJ41PzxN5xZsAmlWcMagPlruVQCLhZ' -F "message=The IP ${I} is added in /etc/host.deny." https://notify-api.line.me/api/notify
done

[ -f $Black_List_TMP ] && rm -rf $Black_List_TMP &> /dev/null
#echo "$Black_List_TMP is deleted.[After]"
fi
[ ! -d ${Backup_Log_Dir} ] && mkdir -p ${Backup_Log_Dir}
[ -f $AUTH_LOG ] && cp $AUTH_LOG ${Backup_Log_Dir}/auth.log_`date +%Y-%m-%d_%H-%M-%S`
[ -f $AUTH_LOG ] && echo "" > $AUTH_LOG 

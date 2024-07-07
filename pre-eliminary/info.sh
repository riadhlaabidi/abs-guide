#!/bin/sh 

logFile=./info.log
date=$(date -u)
uptime=$(uptime)
users=$(who)

out="Date: $date\nSystem Uptime: $uptime\nLogged in users:\n$users\n"

echo -e "$out"

echo -e "#########################################\n" >> $logFile
echo -e "$out" >> $logFile

exit 0

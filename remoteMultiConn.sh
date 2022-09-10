#!/bin/bash

#read -p 'Enter Command to execute on remote machine: ' COMMAND
echo "Executing COMMAND on all the WEBNODEs."

for IP in $(cat webnodeIP.txt);
do
  echo "############################################################"
  echo "Executing Command on IP: $IP"
  echo "############################################################"
  ssh devops@$IP '
     echo "Executing free -m"
     free -m
     echo "Executing uptime"
     uptime
     echo "Executing df -h"
     df -h
     echo
'
done

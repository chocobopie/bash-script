#!/bin/bash
echo "Welcome to root scriptbox"
echo "#############################################"

FREERAM=$(free -m | grep Mem | awk '{print $4}')
LOAD=$(uptime | awk '{print $8}')
ROOTFREE=$(df -h | grep '/dev/sda1' | awk '{print $4}')

echo "#############################################"
echo "Available free RAM is $FREERAM MB"
echo "#############################################"
echo "Current Load Average is $LOAD"
echo "#############################################"
echo "Free ROOT storage size is $ROOTFREE"

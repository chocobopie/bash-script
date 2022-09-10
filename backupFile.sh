#!/bin/bash

if [[ -e $1 ]] || [[ -d $1 ]]
   then
     echo "You have entered a file or dir path, taking its backup"
     tar -czcf backupfiledir.tgz $1
elif [[ -z $1 ]]
   then
     echo "You have not entered file/dir path, please try again"
else
   echo "You have entered an Invalid input. please try again"
fi

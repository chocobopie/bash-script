#!/bin/bash

: 'This script will setup website from tooplate.com on CENTOS 7/Ubuntu 16 HTTPD/apache2 service'
# taking user input for WEBURL
read -p 'Enter WEB URL: ' WEBURL

#find dir Dirname from Url
DIRNAME=$(echo $WEBURL | cut -d / -f5)
echo "Dir name found: $DIRNAME"
read -p "Enter Y to continue, E to Enter Dirname, N to stop: " USERDEC

if [[ "$USERDEC" = "Y" ]] || [[ "$USERDEC" = "y" ]]
then
   echo "#################################"
   echo "Starting web setup"
   echo "#################################"
elif [[ "$USERDEC" = "E" ]] || [[ "$USERDEC" = "e" ]]
then
   read -p "Enter Dir name: " DIRNAME
   echo "#################################"
   echo "Starting web setup"
   echo "#################################"
elif [[ "$USERDEC" = "N" ]] || [[ "$USERDEC" = "n" ]]
then
   echo "#################################"
   echo "Script excution cancelled by user"
   echo "#################################"
   exit 2
else
   echo "#################################"
   echo "Invalid input, please try again"
   echo "#################################"
   exit 2
fi

yum --help > /dev/null 2> /dev/null
if [ $? -eq 0 ]
then
  echo "RedHat based OS Detected."
  SVC=httpd
  PACKS='httpd wget unzip'

# Setup packages
 echo "Intalling packages"
 yum install $PACKS -y > /dev/null
 echo "####################################"

# Enable Service
 echo "Enabling service"
 systemctl start $SVC
 systemctl enable $SVC
 echo "####################################"

# Copy website to apache Doc Root Dir
 echo "Copy website to apache Doc Root Dir"
 cd /tmp && wget -O website.zip $WEBURL
 cd /tmp/ && unzip website.zip
 cp -r /tmp/$DIRNAME/* /var/www/html/
 echo "####################################"

# Restart SERVICE
 echo "Restarting service"
 systemctl restart $SVC
 echo "####################################"

else
 echo "Debian based OS detected"
 SVC=apache2
 PACKS='apache2 wget unzip'

# Setup packages
 echo "Intalling packages"
 apt install $PACKS -y > /dev/null
 echo "####################################"


# Enable service
 echo "Enabling service"
 systemctl start $SVC
 systemctl enable $SVC
 echo "####################################"

# Copy website to apache Doc Root Dir
 echo "Copy website to apache Doc Root Dir"
 cd /tmp && wget -O website.zip $WEBURL
 cd /tmp/ && unzip website.zip
 cp -r /tmp/$DIRNAME/* /var/www/html/
 echo "####################################"


# Restart SERVICE
 echo "Restarting service"
 systemctl restart $SVC
 echo "####################################"

fi

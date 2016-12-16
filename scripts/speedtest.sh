#!/bin/bash
ping -c1 8.8.8.8 > /dev/null
 
if [ $? -ne 0 ]; then
        PING=0
        DOWN=0
        UP=0
        IP="Offline"
else
        /etc/openhab2/scripts/speedtest-cli --simple > /etc/openhab2/scripts/tmp/speedresult.txt
        PING=$(cat /etc/openhab2/scripts/tmp/speedresult.txt |grep Ping |cut -d " " -f 2)
        DOWN=$(cat /etc/openhab2/scripts/tmp/speedresult.txt |grep Download |cut -d " " -f 2)
        UP=$(cat /etc/openhab2/scripts/tmp/speedresult.txt |grep Upload |cut -d " " -f 2)
	IP=$(wget -q -O - http://www.ip-lookup.de | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>')
fi
 
 
/usr/bin/curl -s --header "Content-Type: text/plain"  --request POST --data $PING https://xxx/rest/items/INET_PING
/usr/bin/curl -s --header "Content-Type: text/plain"  --request POST --data $DOWN https://xxx/rest/items/INET_DOWN
/usr/bin/curl -s --header "Content-Type: text/plain"  --request POST --data $UP https://xxx/rest/items/INET_UP
/usr/bin/curl -s --header "Content-Type: text/plain"  --request POST --data $IP https://xxx/rest/items/INET_IP
 
rm -f /etc/openhab2/scripts/tmp/speedresult.txt

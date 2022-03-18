#!/bin/sh
while sleep 5; do
##GET stok X-Stock header
DATA=$(curl -s http://169.254.0.1/cgi-bin/login.cgi?Command=getLoginStok -H 'Referer: http://169.254.0.1/Login.html')
STOK=$(echo "$DATA" | awk -F '[<>]' '/login_stok/{print $3 }')

#Validate user/password
LOGINX=$(curl -s http://169.254.0.1/cgi-bin/login.cgi -H "X-Stok: $STOK" -H 'Referer: http://169.254.0.1/Login.html' -H 'Origin: http://169.254.0.1' --data-raw 'Command=setUserCheck&input_URN=admin&rand_PWD=admin')

#Capture session_id
SESS=$(curl -c cookie.txt -L -s http://169.254.0.1/cgi-bin/login.cgi -H "X-Stok: $STOK" -H 'Referer: http://169.254.0.1/Login.html' -H 'Origin: http://169.254.0.1' --data-raw 'Command=setLOGINvalue&input_URN=admin&rand_PWD=admin')

#Capture LTE IP
IPJ=$(
      curl -s 'http://169.254.0.1/cgi-bin/status.cgi?Command=getLocalNetworkStatusASP' \
      -H 'Connection: keep-alive' \
      -H 'DNT: 1' \
      -H 'Accept: */*' \
      -H 'Referer: http://169.254.0.1/status.html' \
      -H 'Accept-Language: en-US,en;q=0.9' \
      -b cookie.txt | egrep 'getWanIp|getDns1'
)

#<getWanIp>10.18.134.77</getWanIp> <getWanIpv6></getWanIpv6> <getDns1>192.168.136.30</getDns1>

lteip=$(echo $IPJ | awk -F '[<>]' '{print $3 }')
ltedns=$(echo $IPJ | awk -F '[<>]' '{print $(NF-2) }')
echo "$ip $dns"

ethdataip=$(ifconfig modem.103 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')

if [ -z "$lteip" ]; then
      echo "Ip modem tidak dapat di cek"
else
      if [[ "$ethdataip" != "$lteip" ]]; then
            echo "IP interface eth_data berudah dari  $ethdataip menjadi LTE IP $lteip dns $ltedns"
            ifconfig modem.103 $lteip netmask 255.255.255.255 up
            logger -p notice -t lte "IP berubah dari $ethdata menjadi $lteip dns $ltedns"
            uci set network.eth_data.ipaddr="$lteip"
            uci set network.eth_data.dns="$ltedns"
            uci commit network
            /etc/init.d/network reload
            ip route add default dev modem.103
      else
            echo "OK IP LTE eth_data $ethdataip"
      fi
fi
done

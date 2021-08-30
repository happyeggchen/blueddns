#!/usr/bin/fish
function getip
  set -g myip (curl -s -L https://api.ipify.org/)
end
function __main__
  while test "-0-" = "-0-"
  getip
    set zoneid (sed -n '/zone-id=/'p /etc/blueddns.conf | sed 's/zone-id=//g')
    set dnsid (sed -n '/dns-id=/'p /etc/blueddns.conf | sed 's/dns-id=//g')
    set domain (sed -n '/domain=/'p /etc/blueddns.conf | sed 's/domain=//g')
    set email (sed -n '/email=/'p /etc/blueddns.conf | sed 's/email=//g')
    set authkey (sed -n '/auth-key=/'p /etc/blueddns.conf | sed 's/auth-key=//g')
    echo "curl -X PUT "https://api.cloudflare.com/client/v4/zones/$zoneid/dns_records/$dnsid" -H "X-Auth-Email: $email" -H "X-Auth-Key: $authkey" -H "Content-Type: application/json" --data '{"type":"A","name":"$domain","content":"$myip","proxied":false}'"
     curl -X PUT "https://api.cloudflare.com/client/v4/zones/$zoneid/dns_records/$dnsid" -H "X-Auth-Email: $email" -H "X-Auth-Key: $authkey" -H "Content-Type: application/json" --data '{"type":"A","name":"'$domain'","content":"'$myip'","proxied":false}'
  end
end
#app_info:blueDDNS
#app_version:2021-8-26-b1
#by tsingkwai
#blueDDNS.start
if test -e /etc/blueddns.conf
  else
    sudo echo "zone-id=" > /etc/blueddns.conf
    sudo echo "dns-id=" >> /etc/blueddns.conf
    sudo echo "domain=" >> /etc/blueddns.conf
    sudo echo "email="  >> /etc/blueddns.conf
    sudo echo "auth-key=" >> /etc/blueddns.conf
  set_color red
  echo "Plz modify /etc/blueddns manually"
  set_color normal
end
switch $argv[1]
case myip
  getip ;; echo $myip
case install
  install $argv[2]
case config
case serve
  __main__
case '*'
  echo "help"
  echo "myip[get my ip]"
  echo "install (purge)[purge blueddns]"
  echo "serve [start the service]"
end
#blueDDNS.end
#build time UTC = 2021-08-30_04:26:39

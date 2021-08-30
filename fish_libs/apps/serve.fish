function __main__
  while test "-0-" = "-0-"
  getip
    set zoneid (sed -n '/zone-id=/'p /etc/blueddns.conf | sed 's/zone-id=//g')
    set dnsid (sed -n '/dns-id=/'p /etc/blueddns.conf | sed 's/dns-id=//g')
    set domain (sed -n '/domain=/'p /etc/blueddns.conf | sed 's/domain=//g')
    set email (sed -n '/email=/'p /etc/blueddns.conf | sed 's/email=//g')
    set authkey (sed -n '/auth-key=/'p /etc/blueddns.conf | sed 's/auth-key=//g')
    echo "curl -X PUT "https://api.cloudflare.com/client/v4/zones/$zoneid/dns_records/$dnsid" -H "X-Auth-Email: $email" -H "X-Auth-Key: $authkey" -H "Content-Type: application/json" --data '{"type":"A","name":"$domain","content":"$myip","proxied":false}'"
     if curl -X PUT "https://api.cloudflare.com/client/v4/zones/$zoneid/dns_records/$dnsid" -H "X-Auth-Email: $email" -H "X-Auth-Key: $authkey" -H "Content-Type: application/json" --data '{"type":"A","name":"'$domain'","content":"'$myip'","proxied":false}'
     sleep 1h
     end
  end
end

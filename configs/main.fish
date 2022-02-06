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
  blueddnsinstall $argv[2]
case config
case serve
  __main__
case '*'
  echo "help"
  echo "myip[get my ip]"
  echo "install (purge)[purge blueddns]"
  echo "serve [start the service]"
end

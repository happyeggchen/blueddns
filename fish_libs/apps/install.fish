function blueddnsinstall
switch $argv
case purge
  sudo rm /usr/bin/blueddns
  sudo rm /etc/blueddns.conf
end

function getip
  set -g myip (curl -s -L https://api.ipify.org/)
end

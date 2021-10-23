#app_info:checknetwork
#app_version:2021-4-30-b1
#by bluelake lab
#checknetwork.start
function checknetwork
  if curl -s -L $argv[1] | grep -q $argv[2]
    echo -e "\033[32m[checknetwork]check passed - u`ve connected to $argv[1]\033[0m"
  else
    echo -e "\033[0;31m[checknetwork]check failed - check your network connection\033[0m"
  end
end
#checknetwork.end

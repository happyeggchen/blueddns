#app_info:checkdependence
#app_version:2021-4-30-b1
#by bluelake lab
#checkdependence.start
function checkdependence
  if test -e $argv
    echo -e "\033[32m[checkdependence]check passed - $argv exist\033[0m"
  else
    echo -e "\033[0;31m[checkdependence]check failed - plz install $argv\033[0m"
    exit
  end
end
#checkdependence.end

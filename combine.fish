#!/usr/bin/fish
set -g build_time (date +"%Y-%m-%d_%T" -u)
function checkdependence
  if test -e $argv
    echo -e "\033[32m[checkdependence]check passed - $argv exist\033[0m"
  else
    echo -e "\033[0;31m[checkdependence]check failed - plz install $argv\033[0m"
    exit
  end
end

function app_fish_empty
  if test -e app.fish
    rm app.fish
  end
end

    checkdependence /usr/bin/fish
    app_fish_empty
    fish core.fish
    cat fish_libs/main.fish >> app.fish
    echo ""
    echo "#build time UTC = $build_time" >> app.fish
    chmod +x app.fish

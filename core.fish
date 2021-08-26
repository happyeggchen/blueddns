#!/usr/bin/fish
  #this is a Earthenfish mods info files
  function app
    cat fish_libs/apps/$argv.fish >> app.fish
  end
  function lib
    cat fish_libs/libs/$argv.fish >> app.fish
  end
#import something here,write your mods in fish_libs
#libs always before apps
#like this:
#libs header
#libs list_menu
#apps hi.fish
lib header
app getip
app serve

require 'colorize'
i = 5
f =  `echo "\033[32;1mtest #{i} passed\033[0m"`
puts f

puts "fuck me is the ass".colorize(color: :red, background: :cyan)

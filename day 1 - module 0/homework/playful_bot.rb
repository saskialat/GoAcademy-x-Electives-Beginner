# SASKIA LATIEVARYA
# Greeting bot
# issued: Saturday, August 1, 2020
# due: Saturday, August 8, 2020
# completed: Saturday, August 8, 2020

print "Hi, I'm Playful Bot! What is your name? \n > "
    name = gets.chomp
    new_name = name.reverse!.swapcase!
print "#{new_name}! Very nice to meet you! Where do you come from? \n > " 
    origin = gets.chomp
    origin_letters = origin.length
    lucky_number = origin_letters * 13
puts "#{origin} is a #{origin_letters}-letter word. #{lucky_number} is your lucky number!"




=begin

    NOTES

    https://www.shortcutfoo.com/app/dojos/ruby-strings/cheatsheet

    failed attempt to replace each char
        i = 0
            print new_name[i]
            while i < new_name.length
                letter = new_name[i]
                unless letter == new_name[i].upcase
                new_name[i].downcase!
                else letter == new_name[i].downcase
                    new_name[i].upcase!
                    print new_name[i]
                end 
                i = i + 1
                print new_name
            end
            
=end
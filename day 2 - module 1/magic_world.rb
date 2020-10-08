# SASKIA LATIEVARYA
# Electives x GoAcademy
# Saturday, August 8, 2020
# simsalabim

=begin

QUESTION #1

Create a help program that only accepts people who know the magic word. 
After they prove themselves we will welcome them!
psst the secret word is "simsalabim"

PROBLEM 2

PROBLEM 3

=end

#initialize data
restricted = false
key = "simsalabim"

# determine whether the user is restricted or not
print "insert magic word: "
    password = gets.chomp
    restricted = password == key ? false : true

# unless the user is restricted the magic world will launch
unless restricted 

    # prompt for the user's data
    print " \n｡◕ ‿ ◕｡ Welcome ｡◕ ‿ ◕｡ \numm... what's your name? \n >"
        name = gets.chomp
    print "Welcome #{name}! How old are you? \n >"
        age = gets.chomp.to_i

    # if the user is underaged prompt for a companion, without a companion, the user will be restricted from access
    if age <= 7 
        print "are you with someone older than 20 years old? \n >"
            twenty_or_not = gets.chomp.downcase
        unless twenty_or_not == "yes"
            restricted = true
        end
    end

    
    # allow access to the user if not restricted
    case restricted

    when !true
        
        print "Well(︶ω︶),well(▰˘◡˘▰),welló‿ó, hello #{name}! \n"
        #even and odd
        print "What number do you want to determine? \n >"
            number = gets.chomp.to_i
        
        print "\n(ﾉ◕ヮ◕)ﾉ*:･ﾟ✧"
        if number % 2 == 0
            print "This is an even number!"
        elsif number % 2 != 0
            print "This is an odd number!"
        end
        print "･ﾟ✧ \n\n"
    
    when true

        years_left = 8 - age
        print "you are too young for this, get back after #{years_left.to_s} more year please. \n"

    end

else 
    print "Thou shall not pass!! \n"
end 


=begin

NOTES
- good practice to enter a new line at the end
- if this = that statement will not run an error but would not test for the condition properly (use "==")

=end

=begin
    if restricted == true 
        years_left = 8 - age
        print "you are too young for this, get back after #{years_left.to_s} more year please. \n"
    else
        print "well,well,well, hello #{name} \n"
        #even and odd
        print "What number do you want to determine? \n >"
            number = gets.chomp.to_i
        
        if number % 2 == 0
            print "This is an even number! \n"
        elsif number % 2 != 0
            print "This is an odd number! \n"
        end 
    end
=end
# SASKIA LATIEVARYA
# Greeting bot
# issued: Saturday, August 1, 2020
# due: Saturday, August 8, 2020
# completed: Saturday, August 8, 2020

print "Hi, I'm Greeting Bot. What is your name? \n > "
    name = gets.chomp
print "Nice name, #{name}. Where do you come from? \n > "
    origin = gets.chomp
print "And what year were you born? \n > "
    year = gets.chomp
    year = year.to_i # How can I not write year twice?
    age = 2020 - year
puts "Well, nice to meet you #{name} of #{origin}! You were born on #{year}, so you're #{age.to_s} years old now! It's such a challenging age, eh? " 


=begin 

    NOTES

    p on it's own will print the " "

=end
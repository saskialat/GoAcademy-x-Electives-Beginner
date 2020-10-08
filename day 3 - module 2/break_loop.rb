# SASKIA LATIEVARYA
# Saturday, August 15, 2020
# loop and break operators

loop do (shopping_list)
    print ("What do you want to buy? ")
    input = gets.chomp
    break if input == "enough"
    shopping_list.push(input)
end
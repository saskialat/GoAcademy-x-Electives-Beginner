# SASKIA LATIEVARYA
# Saturday, August 15, 2020
# Reverse a hash (input)

#label = ""
content = ""
numbers = [ "one" , "two", "three"]
boxes = hash.new
reversed = hash.new

# creates boxes
numbers.each do|number|
    print ("What do you want to label box #{number}? \n >")
        label= gets.chomp.to_sym
    print ("What do you wanna put in the #{label.to_s} box? \n > ")
        content = gets.chomp.to_s
    boxes[label] =  content
end
# print "These are the boxes you told me to keep! \n" + boxes
print "These are the boxes you told me to keep! \n"
puts boxes

# reverse boxes
boxes.each do |key, value|
    reversed[value.to_sym] = key.to_s
end
puts reversed
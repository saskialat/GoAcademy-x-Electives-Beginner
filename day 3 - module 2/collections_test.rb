# SASKIA LATIEVARYA
# Saturday, August 15, 2020
# Collections

# array

# initiating an array
# array = Array.new
# puts array
# array = Array.new(3)
# puts array
amt_com_obj = Array.new(3,2)
print amt_com_obj
listing_out = [1, 2, 3, 4, 5]
print listing_out


# # accessing elements
puts amt_com_obj[0]
puts amt_com_obj [1]
puts amt_com_obj [2]
puts amt_com_obj [3] #element in index of array DNE -> nil -> no output in the console

# removing a data in an array
amt_com_obj.pop # removes last element
print amt_com_obj
listing_out.delete(2) # removes elements with the value == 2
print listing_out

# adding in an array

# iterating all elements
#listing_out.each { |the_elements| print (the_elements + 1) }


# HASH -> key
grades =
{
    "saskia" => 90,
    "badru" => 95,
    "octavian" => 88,
    "kayla" => 90

}
=begin
key1 -> SASKIA
key2 -> BADRU
key works like index
=end
print grades
options =
{ 
    :font_size => 10,
    :font_family => "Arial"
}
print options
=begin
: does not need "" because it is a unique symbol
=end
print grades["saskia"]
print grades.key(90)
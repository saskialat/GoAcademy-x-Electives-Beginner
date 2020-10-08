# SASKIA LATIEVARYA
# Electives x GoAcademy
# Saturday, August 8, 2020
# Notes

puts '\t tab this word \n this will be a new line'
puts "\t tab this word \n this will be a new line"

# String Operation
first_name = "Sas"
last_name = "he"

# Append
puts first_name + " " + last_name
full_name = "#{first_name} #{last_name}"

#Include
puts full_name.include?("tasya")

#Case manipulation
puts full_name.upcase

#Slice
puts full_name.slice(1,5)

#Size
puts full_name.size

# boolean
is_sky_clear = true
is_morning = true

puts "is it sunny?"
puts "if the sky is clear " + (is_sky_clear).to_s

#NOT
puts "if the sky is not clear " + (!is_sky_clear).to_s
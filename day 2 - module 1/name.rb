# SASKIA LATIEVARYA
# Electives x GoAcademy
# Saturday, August 8, 2020
# Strings Exercise



first_name = "tasya"
last_name = "AMALINA"

first_last = first_name.length
last_last = last_name.length

first_name  = first_name.slice(0).upcase + first_name.slice(1, first_last + 1).downcase
last_name  = last_name.slice(0).upcase + last_name.slice(1, last_last + 1).downcase
nick_name = first_name.slice(1).upcase + first_name.slice(2, first_last + 1).downcase

full_name = first_name + " " + last_name

puts "My name is #{full_name} often called #{nick_name}. Just for fun face, my name has #{full_name.length} letters including whitespace : D"

=begin
first_name.capitalize can replace line 14 -> last_name, nick_name
=end

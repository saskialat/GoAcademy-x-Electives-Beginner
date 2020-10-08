# SASKIA LATIEVARYA
# Saturday, August 15, 2020
# Afternoon Session
# EX 2 

def format_phone_number(numbers)
    phone_number = "(" 
    i = 0
    while i <= 2 do
        phone_number += numbers[i].to_s
        i += 1
    end
    phone_number += ") "
    while i <= 5 do
        phone_number += numbers[i].to_s
        i += 1
    end
    phone_number += "-"
    while i <= 9 do
        phone_number += numbers[i].to_s
        i += 1
    end
    return phone_number
end

myphone = format_phone_number([1,2,3,4,5,6,7,8,9,0])
puts myphone

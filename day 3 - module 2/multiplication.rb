# SASKIA LATIEVARYA
# Saturday, August 15, 2020
# Afternoon Session
# EX 3

def multiplication(x, y)
    # number = y
    nums = []
    # x.times do
    #     nums << number
    #     number += y    
    # end
    i = 1
    x.times do
        nums << y * i
        i += 1
    end
    return nums
end

print multiplication(3,2)

        
    
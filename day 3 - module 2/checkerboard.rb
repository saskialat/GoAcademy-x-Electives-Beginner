# SASKIA LATIEVARYA
# Saturday, August 15, 2020
# Afternoon Session
# EX 4

def checkerboard(num)
    i = num
    j = num
    is_even = true
    colors = [ "[r]", "[b]" ]
    while i >= 1
        arr = []
        if i % 2 == 0 
            is_even = true
        else 
            is_even = false 
        end
        if is_even == true
            while j > 1
                if j % 2 == 0
                    is_even = true
                else 
                    is_even = false
                end
                if is_even == true
                    arr << colors[0]
                else
                    arr << colors[1]
                end
                j -= 1
            end
        else
            while j > 1
                if is_even == true
                    arr << colors[1]
                else
                    arr << colors[0]
                end
                j -= 1
            end
        print arr
        end
        i -= 1
    end

end

checkerboard(5)
                
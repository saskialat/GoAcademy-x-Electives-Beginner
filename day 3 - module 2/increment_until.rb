# SASKIA LATIEVARYA
# Saturday, August 15, 2020
# looping

# increments a number by 
def increment_until(num, target)
    while num < target
        num += 1
        print num
    end
    print "\n" + num.to_s + "\n"
end

increment_until(2, 10)
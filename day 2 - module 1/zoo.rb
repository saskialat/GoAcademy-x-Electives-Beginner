# SASKIA LATIEVARYA
# Electives x GoAcademy
# Saturday, August 8, 2020
# Can I go to the Zoo mom?

=begin

QUESTION


=end



cant = "You can't go to the zoo"
can = "you can go to the zoo"
is_raining = true
sleep_before_six = true
finish_homework = true 

print "Is it raining? \n >"
raining = gets.chomp.downcase
if raining = "yes"
is_raining = true
end

if is_raining == true
    puts cant
end

if is_raining == false 

    print "Did you sleep before 6? \n >"
    sleep_six = gets.chomp.downcase
    if sleep_six = "no"
        sleep_before_six = false
    end
    #here
    
    if sleep_before_six == true
        puts can
    end

    if sleep_before_six == false


        
        print "Did you finish your hw? \n >"

        if finish_homework == true
            puts can
        end

        if finish_homework == false
            puts cant
        end

    end

end

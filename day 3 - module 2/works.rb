# SASKIA LATIEVARYA
# Saturday, August 15, 2020
# begin while

count = 0
box = [ "r" ]

def open_box(box)
    
    begin
        print "What do you wanna add in the box? \n > "
            item = gets.chomp
            box.push(item)
        count = 0
        print "Do you want to add another item? (1): YES, (2): NO \n > "
            count = gets.chomp.to_i
    end until( count != 1 )
    print box
end

open_box(box)
print box

for items in box


=begin

NOTES
even if object is instantiated in the source code, it must be defined in a method
(because its not oop??)

=end
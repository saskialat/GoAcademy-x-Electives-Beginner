# SASKIA LATIEVARYA
# Saturday, August 15, 2020
# No repeat - Arrays

numbers = Array.new(10)
print "one"
    one = gets.chomp.to_i
    numbers.push(one)
print "two"
    two = gets.chomp.to_i
# unless numbers.each { |x| include(two)? }
#     numbers.push(two)
# end
numbers.each do |number|
    unless numbers.include?(two)
        numbers.push(two)
    end
end
    
# print "input \n >"
# pee, qee = gets.split.map(&:to_i)
# print "p is " + pee.to_s + "\n"
# print "q is " + qee.to_s + "\n"

print "input <name> <date> <price>"

name, date, price = gets.split.map(&:to_s)

print "test"

print "#{name.to_s} \n"
print "#{date.to_s} \n"
print "#{price.to_s} \n"

number = name.to_i + date.to_i + price.to_i
print number
